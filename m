Return-Path: <linux-arm-msm+bounces-111696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ICEtGiBmJmqIVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:50:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 043486533DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:50:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VVkSX4aF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HgjZwZbW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111696-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111696-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5116300DF5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1DE3890F3;
	Mon,  8 Jun 2026 06:46:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9A385D8F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:46:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901193; cv=none; b=i3JoEQiFwLJsu2Gkogfo/lnn/4qDuNboOzUg8HouDAEKxlWqZl+lxJERewO+C2VckoXqcX5f+zCiWAuqgObD1hRyo7sSkE+z5SVyBFrvUFUB5jI24hKVjxv4yaQsbpT5xXWgep5X3BQfv0/uMLhLd58GBmz0RufiBVGS3heVoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901193; c=relaxed/simple;
	bh=JN87ctyHPeOxXKmUEmgCodS7Ir+BuB+OwLjPhguGXxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haw+MI520Gf0/g1kRR71pY9srNdDAttSvRbGWu5JTydJe7lPGtbKhc1eFd5dG1wbcx1QGBN+p5dFoGYlG8ETm7ytSgLoE4ABPpTPsdQLVIgSvGMVCuWjEPiyDTTMUG7S5j7UaVZxzWadL5jfVsJjNgijWOBrtkaFKMmzBOlKiXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVkSX4aF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgjZwZbW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586P8pq2276543
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lFJEmac4GRe+nzIxeHA4CpDV
	BFHZhRqSLc23NBTsn04=; b=VVkSX4aFZODzZTy55/C4qMc39iB1naF2/bYfqSud
	XGNw7DFGKtCjORSW9HJRZpOj5xSi8CP9xOQRASa5+gtNoYQ4jNsFT/tb3b6fURRp
	0ZZWIDvs0aLu1mnUDTo2JCwgG0574drTxCw4vzaoSsO1u6ULs0FLrMtKdx7AGWMh
	w/mfFTeohJL1Kumqu5YzFX1Yg1MEYpidJjZE4ldZnx5b3OUkL+oqtk1n/8LqSj+h
	sSe7/V24UymZ5OSTv/3sxmXVdNR5vsTc+amWg77ZAZ9qTLnHGWLGHTum5VyEAO2z
	lYorEMkeFdshyuVluamhPWx7IFOSs2DU2+SqQ1EMCu+atQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgx2jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:46:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfb3463931so5144973137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901190; x=1781505990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFJEmac4GRe+nzIxeHA4CpDVBFHZhRqSLc23NBTsn04=;
        b=HgjZwZbWHG/8TIpnCUkbbRlXtIJFipmD3q5UcOV/TKptm72e0eMHaqzSxpLGeY7+8k
         kVB7aSzkh7uhs4Tr6ULWfOUAluB86IkGO/z9M/WaXYYPUUvhoxZxDSVpEVS4vX/NZdl+
         mn7S8YDU/Y1Inxo73ZuzcH7o0IIDDXeC5IUPB+goj7BkDnajqLCvr24fHfsBrsRBv+VC
         TldOg8XNpIGhCHwb6cTErv2iNiWmolZowmefFRS/wfyuutAslmgt6oGDmqX4PV+lVvrw
         dohJbRbKa2GpRgqW+1Tq1g82ksEJOPnjfaoEAYfJfDfhDk+LDQpzxRYbKTVoXnWF8Zui
         bxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901190; x=1781505990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFJEmac4GRe+nzIxeHA4CpDVBFHZhRqSLc23NBTsn04=;
        b=ehYH8KlqV50Tj+64xkzcrMlpQlFTUq82BQhSa1+vrITSTXZbUHXJF9AkKbk9RsfuYk
         YLCTGlVnlSm/MqMJLrPXghcUJUue1vzAzQIJfcUO2K9BXCd/U9TNJpVTr041YvGiqfId
         Hy2tArUHeGsU7DyIIKCdR0GKRklLG2i/WwHyvJZRl+w4b+T/RwE5xUZBNzOaNvfdQWQP
         OYwQOfsLPO/OzweODBb8hst2YpaNnKEAgj+cORQOE7mV3WY3PUCIprJDI+iWkcHmViS0
         9P+Vtvr3YmmOSKDtbUoysR0nxu2Y+d58HUDiaf+uhYu0ihQcvh3UgXMrLETRZxlI6NAu
         44yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DTPD/ZRCotfP6ThfakDWL4+4zhqmHQKRYxoDd3/15nDDcrUqUCu45wGMRGTHuYLJ4m6dUEQGeVZqVW4x/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qowbD/NNv78FbPA1Slt1WdDRYYfcF8qDj+o+lzlDwuuWxpPY
	eV2+WQoZkXf2/Rtcu33btGDqi/jPY4Si5U7x/AWqvNmZ9bSdJAPGspLCMesf0TQGTAP/e2SayJR
	fHbzCRl2d+rADACSXYUZTtcYTO/D6uSx52ZKklwjKgk5RfU2lo9j5CH3DrXZEukRfgDiD
X-Gm-Gg: Acq92OGU7/DTggL+lmuf7kEDOphsZH8Nbk2EBIe7VJVZ2/w81oQ7xRsqMtOlNMLobHK
	joQWLb2FOGv+l8MP8vhhYkzBSQG3+HThjDFnfes/SWAq6b/ylWgACjELhCTP0SK/DIvVkKjYY2A
	WUfG53zZWEfmjn+BVYmEM7aHneZosD2iyeJhlByCMx3CXW5z4VGsG6AVeIXcqvhpD9nJARx6dmG
	WcYbN4TXyZkyifvWyZkvu+AA1bCV0vTR+XMoOMU5Q2oPlkL1H6B0fTAg3oCtRAl8nysp3FoC2Qy
	ttAoYB/GvdQey9PyK8znktCGy5O4316RMloR0CVwvwcdPpL/Yr//d6FYV7EqIjQiMH22vT2MIFv
	vCFiHBzWbL4q6RL7TidWLOuSta7OhmSmmGEmGUK91Lby5QiUo7TwbJ836lkARnrWqyTdDOziQDi
	5IuqratQ3XCKT1lxu/xvmYAeMfrMNtMsiDayQsHZXhxPmxbw==
X-Received: by 2002:a05:6102:5cc2:b0:6d8:f538:f01e with SMTP id ada2fe7eead31-6ff09f9542cmr7603041137.24.1780901190569;
        Sun, 07 Jun 2026 23:46:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc2:b0:6d8:f538:f01e with SMTP id ada2fe7eead31-6ff09f9542cmr7603032137.24.1780901190155;
        Sun, 07 Jun 2026 23:46:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9929cfsm3596342e87.75.2026.06.07.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:46:29 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:46:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gdsc: tear down per-domain genpds in
 gdsc_unregister()
Message-ID: <ejwrpaafbc3fbfjlhsho4lrv24wjwxo5nat6pqns6cuhgzs2a4@qojap5ykmdvd>
References: <20260602140934.796697-1-github.com@herrie.org>
 <20260602140934.796697-4-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602140934.796697-4-github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a266547 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=wpqClQe9m7PrORRek7AA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: dMfX8DDThqaTQlqkgig_RyBCZ_ucfqML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MCBTYWx0ZWRfX49xAiR8daQRx
 7LBQFPekaLSr2Q0ShlNgfyhHZY0V/DFSC9x5uJTSd0gwlX9NSuks463/v9a2mDYkAJHDpYR1iIt
 C3Rndol3U8Aewcjrj5ytM2Hw7a/jpjeUFxPStsYFa1ydYmKkYidS+YPcIc6zzzutX9wQdtU9a5Z
 VoMcwEKOxBuS4LkTYDZU1z3LklqEtjquYkt9F3ZtVsO/WX6jDeq6ALzrSpN9CbtiqDutahf/RKS
 r1RsLNeYMlUzZVaR/qL4r6UNATm/he8aSF70vxL+UWMdVXfb9DSWlQSRH5qUAOk/ASilEPFkqX3
 0quBRHzNGkx+GHTG6hP2tH4I15tL18umlrE0BTPIGV5SkYflbXWmWvXMMfsWTe4JPUUFq1faCB5
 npodm7d+/M9v2mR7j4rw7D5d4hZGotq8SvVcYGk5gTx8vT+MkacKLoLHEbkJhjrt3YmBRUz1GUw
 aNGI8pacv/p2KgNfCgA==
X-Proofpoint-ORIG-GUID: dMfX8DDThqaTQlqkgig_RyBCZ_ucfqML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 043486533DA

On Tue, Jun 02, 2026 at 04:09:34PM +0200, Herman van Hazendonk wrote:
> gdsc_unregister() removes the OF provider entry and tears down the
> parent/subdomain wiring, but never calls pm_genpd_remove() on the
> individual generic_pm_domain structures registered by gdsc_init():
> 
> 	void gdsc_unregister(struct gdsc_desc *desc)
> 	{
> 		struct device *dev = desc->dev;
> 		size_t num = desc->num;
> 
> 		gdsc_pm_subdomain_remove(desc, num);
> 		of_genpd_del_provider(dev->of_node);
> 	}
> 
> That leaves dangling entries on the global gpd_list. After a provider
> unbind/rebind cycle (deferred-probe replay during early boot, real
> module unload of a clk driver that owns GDSCs, or an OF-overlay tear-
> down) the next gdsc_init() will end up trying to re-register a name
> that is still in the list and pm_genpd_init() returns -EEXIST.
> 
> While we are here, flip the order so the consumer-facing OF provider
> entry is the first thing removed -- otherwise a fresh
> of_genpd_get_from_provider() call racing with the teardown could
> attach to a domain that is mid-removal.
> 
> Iterate the scs[] array and pm_genpd_remove() each registered domain
> after the subdomain links are torn down. The regulators stay devm-
> managed (devm_regulator_get_optional() in gdsc_register()), so the
> release happens automatically when the underlying device is unbound;
> just the genpd accounting needs to be undone explicitly.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gdsc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

