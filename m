Return-Path: <linux-arm-msm+bounces-104427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GPaDBZI62mWKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:38:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8C45D36F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED663019195
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6891374E7A;
	Fri, 24 Apr 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csOifIal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gguhBx3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852F36F414
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026716; cv=none; b=GRBajQRek7Ev8/1549NHYLG4vB/+eY5azcwDrtuZ1p67Fxnk8zRLO1jmkiMzh61L3d5+zCuQhXDfllNxKF+fUCGquEZXoTxj8nzQcO7TOoBpCIukJdRE1aSSqH4XrsomaCHasve3enX4LLhDBS+0K+YsRa/9XX9kogKqd7EtpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026716; c=relaxed/simple;
	bh=PFSNKHkDRqAk4wNY1w+yqF17MR3wYWgaSnmG61Si2D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae4kual2rkPE+Szrqh83EXyrcEQcKRuiqob5ljvFE+HLf1sN9q47YmzjlP5DwfqZjlHuSNaXfcftcP2XcrUla4bZe8TpHX2OgaGR1+D+sl190wMgKlkXH3m+TEQk8X+CyjGqBGG3gae7uhyz5oPLq0GcVWUPhEv0tgGLDSIOtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csOifIal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gguhBx3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9N9e5518493
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i7lzMLCsxmoXkNQBIxyqcDtQ
	NL6NkENWGxEGYzBdtYo=; b=csOifIal/F+WCvB+OdV3zRpW0qRS9zdJrROD8njW
	56qSJZN05cYRXPHUTZJw9Nwlaq91MBTfUB1B3VWvY/XXhk2Jz/HwVERj2aIJMUIW
	IqosS0Vumc86e7iaVx0GxEgfT7AnYHMWP+8ztBuMZUpuBws1fHUsh2EmqS7u3UVw
	v2BvkGNT+7PWBODuYCcs8p/829nErjaaY/Uyu4mJkusAzDJFAfwMie7c9eAXcEw/
	VkRyL1y/q26Y/7l321r2vtLStB3frRDcTbRQjR/0HbxNM0IQrqkZFXOcolAxVDvw
	fuRv/sx04/8Gj7o+yF/6wtbIb6RaILgetoRaaMdbiy04Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhkmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso90627661cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026714; x=1777631514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7lzMLCsxmoXkNQBIxyqcDtQNL6NkENWGxEGYzBdtYo=;
        b=gguhBx3hNWXk2yKosyKqgfCdnGljKMCzn/apu7EQSj9XchCgw27w+30tUG6IiXd9HU
         SCFBiHkJRiD5sZ+cVqjMMqut+1Ik6jWqrGLTZBLuHadsqW2tgJu2JY1up/X0YzAcKrw7
         rg6cTbTQ1Abs7JvN9FlDClmdthJElnjpd6KiuLDwz/ztrqjETxWxh3oFzhfSQkKxXYF2
         J/MUgAnIbXBjyyOxR1+Rj08QF98KUxQUHuIoYRBBHd+8XvAe5fKF4mJdjWg4+V3OuLqs
         1dQyT/3F1yGBZR3ViS7etOoDCxTflHki3slhqSIxSKCb/7PjA8i1nZbbFcqFCMYdKkJ1
         Du/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026714; x=1777631514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7lzMLCsxmoXkNQBIxyqcDtQNL6NkENWGxEGYzBdtYo=;
        b=PerlEUpHFzcE8UDWWR1xwjeNwV6GLgjC1ZT5qeg38eK/KDPoyDTtC57RebAa8t6EFd
         YMsYRiMyZabqDWQo4xT5p7J7eztU9DgII6lEK1ouquNsMS3+IDPEjBDAB6oi71Rh2k5L
         xH+GkGVKYgbDfmEHAeWSSmfcHNOBtPwEIEFJaKI4G6eq/ThlK2sAFGaIGqWGIsfSRig8
         oV61y/J8lNIbkLl/MYz7taG6o4XveAeW+e926D5g0lQAkEvAgK8ZA9mHB9wlKoRe/oHH
         SntrV/7/DqtfQWq+GtNhkAD28oT0rjE/uWdJM8sBvWcXgJndKZ3kvtc+UhMg1Yi1hzb3
         BbMg==
X-Forwarded-Encrypted: i=1; AFNElJ9+pStDPLKJUb5BCwQlRL/h1bZlNkdMZXjGgZw2Tdc+nGxfbsR36tq3ymcBRqCJDl5MCE+CX3f+uY26t6QX@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwKvotIUk3ShdnRb5wrhIxwdgJxOwYRqi2+FH5r7YfmclEhoq
	MddJPO0u7kzRTeoEIKLkLzzT6PVVidWY3IETARc7dU4OZ/VsfLit/J0+UbxCkGOYa934aIvRobE
	q0HLUGS3VKWJACJAB+z+DagL03ZPa3U9Dof4L6FxiJ6s2nhurJdlJl389w6oGvDA1woax
X-Gm-Gg: AeBDiesOpUouJJAPC8MsoE+IJYhTX5OayZJplQRgc/XdhHcih7WUpn4Op3IijYXYczB
	JwNCsQCSj+69u+HXZqgOUHQgegc1FhHw6ozdV/9v79GBaTe/Iobz/9Aumebtysv3Xbd6GmPbDxn
	QDKsEywtEQC4hQR6SeZSfhkedJPSOMo7xPfUmH7ym6B0Z6qVq8Eu5MHdzyXKHQX2eUgcQ2P4ZcC
	U62HgS/fmNlvfivHpNm+SF7Yv/ckY7PRBUXfd5acLZFK6y2jEyx9bl5bNva9QPZe2ZgfMReVEOE
	bUXgcDh8QqSCvyZATqPDqwfdFe7tNV4bXquW1MDtES6VZKknIY1DVM8OPrpXTC1mhgG/4OeERk7
	R8cpPcHHmCny+hPofE/K7HyAwKxwoHeXpOHHquiLK3EXsmm/pIygNVBK23g==
X-Received: by 2002:ac8:5988:0:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50e36bd6e6cmr472707541cf.15.1777026713724;
        Fri, 24 Apr 2026 03:31:53 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50e36bd6e6cmr472707031cf.15.1777026713262;
        Fri, 24 Apr 2026 03:31:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44123d23e0bsm19799801f8f.15.2026.04.24.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:31:52 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:31:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power
 domain to GCC
Message-ID: <wvadbeipr7cuw2vrvtwyaqlarxklp2squgrzrk4wgq7thacmxk@v5gm3e6fbvtv>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb469a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX9t0f0widzUc7
 +809Jud5lzWLX2ifTy2HJ7TW2vw38AUb/MrFf7XpKvAgfb6wU9epet1tsSXvZKDscqS67VFejq3
 Yt5g1GsB2JV52gqFbk0rta4t6ZpVyyt7znRWVH9B/IYDkcbc0YrODZR9xcvmWD6OpRGut5qY3U9
 qbN2JRKF4LNkKhPIk0zvJXfrzXgm52k9Gcoafi5x7DMI+LWMh/BvWZ9zb1J4zd52Sq1xKNW5lqH
 rS0HOAYbdVL25SqEXv49Sq/HtlRM6LD0AhoFhYK+EYDRL722pIwkftHOEFIZsQvaCY/yt/5oSWV
 CGFhM4qRLcl1DsF/gqOl/UdMyX3n4CCE1oQV8SzDcWd0HAZGl2IcWIBJPjro7Qu7qIQTM9CE6Ak
 mTkRJsWPzdEngM/WPUsKGJbtyTy91OprB7bZiUO6ubMeYZcwFFskYQ8v8QW//q4YC7udGfNoOEd
 9P+PmnQl7JJmOq6bicQ==
X-Proofpoint-ORIG-GUID: QWluYkHFFN06Ltks-PX90DCl7rjNnXt-
X-Proofpoint-GUID: QWluYkHFFN06Ltks-PX90DCl7rjNnXt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099
X-Rspamd-Queue-Id: C1A8C45D36F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104427-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-24 11:07:58, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

