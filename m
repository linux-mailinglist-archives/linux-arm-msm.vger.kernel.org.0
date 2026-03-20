Return-Path: <linux-arm-msm+bounces-98881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKkNMZbdvGmb3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 06:39:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CAB2D5FE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 06:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80BB43009E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 05:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806222F39B5;
	Fri, 20 Mar 2026 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nb96Km0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHppVFsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391912E62AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 05:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985169; cv=none; b=Pem+aX7Ed6xaJp+2YxpEkJMFv7tUcsYgblrSGJ4ykMRl/fvTKwNL/GzQwI62lifTP87wOfpOdFpc3Jz5MuD8xFMgApXbxBC3+P/Cq47cbFLQDiQnx9Y9E4kPqeG+0P+U41phAxtoF2KW4PBgQY1g8+sSNPX44jOdf+FKT3vEjhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985169; c=relaxed/simple;
	bh=tn1xlzI5Rsz9i5z+/pm+Z9WjiBMi3P8O1OnrgdXz98I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG9MO4EoWSkQQ0i21hDWpho5MS6wCGNh4+It0JnEbR3VrOdjRECcIkeLrKOB5uneVUjOvedupNiGG3jwp/6TcLOdIktj0tbBDNkZmMPKdKRWx0FT+oJz3yMSupeF67tLR2huiOsoVOd9iC974T8dKIhJkqR9GHhZSAF53ut6Ofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nb96Km0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHppVFsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Xhob1691935
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 05:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j4ERqPzE1Zo551nVhEOlkvzN
	9K/lc+AKC3gauqsRUQ8=; b=nb96Km0vt4GalVJZFzds16Qxbpg7k3fQPv4PVJHO
	0hFmppwxVzyp9ZF/W3gFyES8uUe3IrbRxFjI5vm9vUfjBNAdDhfZOlu3UudRAXVi
	hppOOdUGk5x6ndTZbrQl0/ihGIG10ldteHcEjnB9mqp4JZyahf7jIjwSy7BNOISm
	uqoYy7Bfm6bIYAECauR1uXHtS7RLWIlnTlKjDFLfOzNtaB4TgcFSAIoJGFxQjxEQ
	7JJtKAKLFybaij8jg9mp7SQ2rssr9dIbnyvYcHuVI5QmfLXtMlPmlvzU+HA9B5mU
	ldRg6JtFh265Ex7WqO/ZsktqzEI0c9PH0i61ljc9DEXwxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d10x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 05:39:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso126157141cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773985167; x=1774589967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4ERqPzE1Zo551nVhEOlkvzN9K/lc+AKC3gauqsRUQ8=;
        b=HHppVFsDAnKYunwySy9A6lj/dj7ZK1hHAyKq9ei03bDyRyknVYG5kpYRa6sK1ivPZv
         rcKTYOC62fTd2g/1qArxyWjWJbQLjkMWhLLCaLY7WJF4D+3E5N5zum2oxQlh8kcw1NBW
         4uuViB+ubBPJX1/hnjzW6DlUDn+PsnesS7KmZq8NRAocKm0W5hgUW1RmlZm884CClsYh
         5qr9N9YdvlstcMHqfnfW/Rof6t/P7t9SKfZMrON6WjWRtWCxOxrNBLIo3PNHkNVgN9/F
         qJNwxZaTRBoF3HVWMFRamISytX7osC4m1aAq4hwaInTWwC/i83LSWU7Rk7GQEfAWZX34
         +2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773985167; x=1774589967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4ERqPzE1Zo551nVhEOlkvzN9K/lc+AKC3gauqsRUQ8=;
        b=lmYSNpsNC6ejORtoi9EULOJQ7vywj7FUYV7ViA7m8et20tevSMB/GUxGvMdWsb+9qi
         7EuF5gvCtuhKTids/qgefvlNViHRtTtPjcgc7b1jVj4Xg7RhOK07TsHe7ZC7EwZydCib
         G0tRRv/PBkZifPhM+SV9Z1Ny9hoFHN9FqxHqN3+NYzuzLF99ynjHcVEH1f12CvlGNM2+
         PRGKHMAo1OfZCygsMRe+wmBaLR5kvWh7hBf0ZYCbhbdNyT41WwXHj0Xbrp9u+6jgrERk
         WA0bs+m81CFrygqw+oa0Z5h3A/uTVy6Ayyce4gwJobkX39C5xZfmiYU5Lv/xI8M0w7zw
         ZaVA==
X-Forwarded-Encrypted: i=1; AJvYcCV44IaZJi/j06QcjOE0z7XWuymLJOLPoWvGKVQct72W2hZSyGTuy44iQ6ea407/Uc2jiYnUB5n/qYgXBimQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTA8KRglPg/OAqgZhPbmLWFQ5wM0hBfVA/bLtYE0xCCFC3+cB
	YrnPTOUABWTDugkRioAl7iGhaXG5aOjKlR3JuACcMRZ8FOAP/FHU2Sl4CwRAfIx02ocPxeZEMMP
	zV7kO3ybCPDAPVmwQyHUZH3Sl+kDmSzGyfmdtjdx8xzeqVz3dw4I6mGGpVNMhRo+hOcEy
X-Gm-Gg: ATEYQzzuaCEZJCH8Zg2v6hV4hEe9Veb+fRr0i2jQW6nd7GT9wLijLYfJ1SvMkmjwAoC
	YdyOB/kCOz8fmLLAZxNSsiuOCqAuLZ11Mpqp2p9dGmuonkEQHj+ySFVkzyKAvahpW4/DDXin4RA
	03WcC9RF00DdxWC+Kf/R5hImiy/X3tMn4d43WcA3RRvCofxbmWLxemIdT8xYlTwLpaKSRfNAup5
	mo5cuoikUiwFm55MDxQKGaB2f88mROK7vEXVN1FoTfIZhOA2ifOse8wX43odMChwTUU9nMzlNwe
	LtGVEHqxhzL2V+oniucDELgzKE1AWvnq7JoFK6yOnt0yR7dfCnjGPNzn6wVMZPr4LomKU5xqn0E
	37y+FgL66IzPneIf3XmZy22XotECYityaUGq3izhhGD4H0tUieQfyoaYkzwrZBV8o3/fG4OsPe8
	z+7m8SnaHp+owlquQZHr0e+qBGawaQgKSFKaM=
X-Received: by 2002:a05:622a:49:b0:509:2222:4201 with SMTP id d75a77b69052e-50b375b779amr27242191cf.69.1773985166492;
        Thu, 19 Mar 2026 22:39:26 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:509:2222:4201 with SMTP id d75a77b69052e-50b375b779amr27241971cf.69.1773985165848;
        Thu, 19 Mar 2026 22:39:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf976ff2fsm3238171fa.17.2026.03.19.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:39:24 -0700 (PDT)
Date: Fri, 20 Mar 2026 07:39:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: edp: Add per-version LDO configuration
 callback
Message-ID: <hc3jz44ibxye4jm5bhjwdcfjg42ia3of5crzgcgodqc5kyrotv@d7jw2joumry4>
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-2-ca8888d793b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-edp_phy-v3-2-ca8888d793b0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pLwZqg-lWgiDlviM8bBHf2gBWQTfBZY_
X-Proofpoint-GUID: pLwZqg-lWgiDlviM8bBHf2gBWQTfBZY_
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bcdd8f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=82J-8U3TcAj4iTVDHMYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAzOCBTYWx0ZWRfX7e1+tLKXoLkO
 dQ4/xBas0dcwpGS/7pHAX1QHckbhd+s7agIyM0ne2RUE/2ofFe5SoRfm65UXEFaBMLqjknblw6S
 ipcLFM99A4fgxgNfLWWt3JGHDDPs2Hpo1slY/n3SEhWMDc/POhXGVm1X8QEIY/NulWE48GTl6E+
 5WUs1gO2wuQk1weDg2L5kUJTP5j37+V02omzsWK8t4NC3Tc24x/Pt1JPQZIJ83Ir8Gr8jQJlnCx
 u60JydpMPIofBrQ9VHjxh1Xh+sGsTJo1eHUgEkAxvhJ39+UGhrldWGrX5CH/jD1V30E8Tx58icU
 ATRxEZnuGzo7+g9jis25YVqdlb4oEG4+kvzqhfJUzqpcQEFufWC1oNKRdwfjiM8qVrLMLIuvEGU
 64w5QtIVBSSzrSEIzWf37GFxHuhkMw6TDd2CIhpP2j481kl3nDMuKmiEuvT+DBdgt3Yv0cVbIA0
 2MRSsJFONbrUUv+zmWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200038
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98881-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99CAB2D5FE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 04:28:30PM +0800, Yongxing Mou wrote:
> For eDP low Vdiff, the LDO setting depends on the PHY version, instead of
> being a simple 0x0 or 0x01. Introduce the com_ldo_config callback to
> correct LDO setting accroding to the HPG.
> 
> Since SC7280 uses different LDO settings than SA8775P/SC8280XP, introduce
> qcom_edp_phy_ops_v3 to keep the LDO setting correct.

Please mention that this also uses low vdiff for eDP.

With that in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Cc: stable@vger.kernel.org
> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 86 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 76 insertions(+), 10 deletions(-)

-- 
With best wishes
Dmitry

