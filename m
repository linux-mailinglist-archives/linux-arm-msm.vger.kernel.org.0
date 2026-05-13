Return-Path: <linux-arm-msm+bounces-107229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ8VKdAVBGqDDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 08:10:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC252DF51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 08:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35A403019FDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 06:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2133655DB;
	Wed, 13 May 2026 06:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAaKKz9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcWMM5Qq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF03D332C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652620; cv=none; b=YsdenF0lYjrzc+XqYMB6Lu7FsNre/udkJfTVcFzqzg9WYuN29xnNHJOMhIL+sLMNXf9UxPXJqnIWYTxq0VNpfFcUFyuJjkcMe2eaLYM3FY8AeSNuxmKT7qs0sODuOm7mnKE0ZHeqIlvdHWGPvwBgxzKi1JKCWS8f+ebD0opxATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652620; c=relaxed/simple;
	bh=dggwVgQZYATZcpFGtaCTQytuYjp6og6z1rYuBox7Xcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCT+M6OB0/7yqLDom3D1ulalMhrIpYnxYPT3KKZb+5s/22bpeS1sYJVDEOZGXWveqoupIntE46VrkpbrpVvCbMN00S8Bja3RPnTP8BXcXc8NJCe6xkgR3l4aV+WsU6kwsUawSPWSzdHNJKxKGgbwLbKeEcsSHjGbRWOZcg9QThs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAaKKz9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcWMM5Qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9hW3527635
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YIyBRKcx8/a/vOQXAbbJJ2Im
	8kJF/PgRbMikuhNIDuk=; b=JAaKKz9sd5/Au+Cyz4wwkJyzbsA6dKhrUxkFgoFo
	zv/KH9OrzBHNX8I6Z0866cI3x2jg0SHIhubONfmYS2qMj7CMdN7rXwrEBab90vTe
	zS4Y2l8JONNPkJKgJiqeKiWRLmitGmXLU3trNMg4YoTFwJE/YOvdbHqrpeWpk1a7
	Iy8ZdfSq+Lc/gQ7ZsFfdT1/U0jf/2YJspYAfbxmQ/1MRY6aYauLbn60LoB7RX/Kx
	1yKCgI4JabZMCGNv7JtBd2xWRSYIWyI6EJyG7o3zTHaOZzmTZJaH7YQEY5qyCaWG
	mozHmoIY2n37IWCRrVUNrDsiHbuiX3wLI3riQhwBBRU88Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f33e2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:10:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e2592ea3bso36696831cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778652617; x=1779257417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIyBRKcx8/a/vOQXAbbJJ2Im8kJF/PgRbMikuhNIDuk=;
        b=gcWMM5QqcIgkInQJLBQ8klrfZEbD8sRbfG5uHmwPeyGi16hab3aBeJ/N63PGxmBx7v
         jIyBV/BTJTHHLF5v92tGo8Bu8+OKqh3GAyoL+IaFnk3SGetROEimvaXbomMMWjl4DgOX
         RtK3yHb9fa3Jx7seXopg93pFS5uTfEHM+s96CS+4LElE7NKWkEWKA+Von5HFPaUtReA5
         004F3tiGRliWQX3gT4pBiWwNhdjAWsPeIuFnRuT1RrmHHDCgRKiiiPI/LmsfKZT3K+R/
         P+ci9Y/J7RPCzKArhRgvaC9VH3UM02p/YJXIPbrFgNiFqH76bkZ8ZM1soOJoRfqvdxp7
         d7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652617; x=1779257417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIyBRKcx8/a/vOQXAbbJJ2Im8kJF/PgRbMikuhNIDuk=;
        b=DbhUNcFD5XAogWKCRQXiNQihKK64GllTNH0lTbx0JVNnVSqkhIDSDsS93QvcUfog2B
         D+8Rom4z95bOxN3khwt3nP/bqsQDwCjC9H7qRAqrt7dMZm7ssDi4BZnSkUMCyVF5mSID
         SzkOJ3ymd5R8gs5fN4y7dFpCgq7Rj6Jz0nUkjjnvlxteY8pxFtki3peM/uNxAqXaZTaC
         OpnM8wSz7aIP2xg0Sdrj2YqZhQHWShqIMoxfS6MTQvD6bDDUerwn5kpUwaAhczsPYeIk
         CiEiPrQ9whD6wz4L9VUz9Tlt54YC1oMM5oXutushKTnqUUG8q5xRoO5TjncGjZR7sWtr
         jB2A==
X-Forwarded-Encrypted: i=1; AFNElJ/aNnvS5fQov3AQZxO7qDmPBOV7dpuyv36drsxvwy/dB7uxztmTGjHqPiZXoSDaKv6Dw33jxG2AcX5lsmbv@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZZwWEMy1gGhhND3zHOrOUmj+Ajv9pYgwZvwDXOJFz3HpYduI
	noXjSe+ts0PjbGA5bo1TsyCUxHxHbq75Ns8vy03X7n4shuWeRF0OrkXT0DLIWujpVUrWVtOU9Lq
	KOurLxE2lu76CEDmmLaUnTl2vVR9Y4GpHqcfsTzLoHGGT5tHRfFGYl9hNtBIuCAL5xdW1
X-Gm-Gg: Acq92OEGAqG/oCC6e4IiCmKyuTvLqlDbKMdk0Q6qbXAT6qwNFKCECS+BxIfJibZ9rJ0
	r8A0exnrcjTYX3vPw3EFtMSkLWZ15/g+8SMgZrOI/C/joYAgu9RgEoHK/YF/Yum91s42nhK929o
	yH7m4hmfH9x1QFZJVx9aJlU9YZQohsukECQ2WwNh0Zhuk+a/d40al8Ah6PU1fhNksj1/g4DTXco
	2dzZU44XCwIlPN/dzKQ3ghIOMZdFr5mWJ55p28hDyDWfatJs77XKuS67eAUl0xuHqZWs9/MCY3m
	q2zRzMWhu8veL90ohz9WC7xI++XrBA9Tt3D5I3hYtqPEU2kiGo55n5Smk0UsspYYgSV0jugUrjY
	ffOZnUnZn0fiw3wscIweSvNuzslRSU1Fj7EWK84sNJGyOpuA=
X-Received: by 2002:a05:622a:1f0c:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-5162ff467bbmr20543331cf.38.1778652616897;
        Tue, 12 May 2026 23:10:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0c:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-5162ff467bbmr20542941cf.38.1778652616255;
        Tue, 12 May 2026 23:10:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce37b308sm46365135e9.10.2026.05.12.23.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:10:15 -0700 (PDT)
Date: Wed, 13 May 2026 09:10:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
X-Proofpoint-ORIG-GUID: ZrdcGvdnAxhlOluNCpsWA7pMzpMhODcP
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a0415ca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i2al5Ykz3Aht5zOOcbIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1OCBTYWx0ZWRfX+2YWRPC94TVD
 Y0F5tQ1jnwSjnZXMZLdZrprwnygcCI5DzWSxKCAZ/JKQcJWy1sQdLh5DGYbEFzjgdnvqcUN1hFM
 91wNB3PvVsWmheMmS2O0DUCtrIUiDDDjhYsFlneXojYicwDRw9qHcX4bxfXS8D80JqtLJEO2ove
 VV6da7XavgpK+whLxZeGU8C8iubbysItF1WKhctnj2L/uYu4yVfmxoQjtMQluSV+FoErY7C5j3G
 D9KLxuSUErUOFBySoIYTTvxbAR5xhINEyb3cg8L8chX8e0UmihU/GViRqfQg5VQgo8tSkRO7iVW
 ZZHHZwDxYhK7MPGpviFOF/MZrAdKdmEv6WodX5auwTdVbDt3qTCMXL/m+hO27S7rXxNLJEw/Msn
 Wpn2vy5NZWWI5Mr+sJrD7pK+7ag6NpPnC3TWTIWyJDS1Y/slQd04pgQc5baNsWzJZQsV9JVQ3Ko
 cumEhZgln2qFTXS0wcQ==
X-Proofpoint-GUID: ZrdcGvdnAxhlOluNCpsWA7pMzpMhODcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130058
X-Rspamd-Queue-Id: 0BDC252DF51
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-107229-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > 
> > Describe the port and repeater, and enable the USB controller and PHYs.
> > 
> > Also specify the ADSP firmware and enable the remoteproc.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > +
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_hs_in: endpoint {
> > +						remote-endpoint = <&usb_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss_in: endpoint {
> > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> 
> No redrivers?

It will come with the DP support.

