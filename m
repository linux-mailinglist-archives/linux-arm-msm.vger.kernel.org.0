Return-Path: <linux-arm-msm+bounces-114564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BzSFF5lMPWrv0wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 17:43:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8886C7252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 17:43:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QR2TJaS2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ns0knlWF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114564-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114564-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B0D93080FAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065C223392F;
	Thu, 25 Jun 2026 15:41:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEF26E173
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:41:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402090; cv=none; b=TaeNe3WV6+8aemDsroXGWpC+P7+ICiZ+1j+9eEcR/W0sXuN1Nl1HDN8qv42Hlfcg53n0SkAR3bPMURywxigB6/a0aB0ITNJuoU2gltiWcVdj9JPOLGgtHvYq3iTAQwk3EnfDBi+0Io4bNaCboE9tKnA8xlDDUJVmEIKyb4bPK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402090; c=relaxed/simple;
	bh=TMS/Eni9iJcWLOPOcIhJacQLBtwyb1sBJqX79YJuijw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5ISP2zuZTI9jkqJVP0zwjp2sgfl0f3EyYm1KbdWMynU2zAr9SmY3I/E9vn2V29rqi36ajL/8LLbKuWuHIIU3uKGa2LSjYHZgCXfjE2Pj1tTzLnWUyYuVwq7pCvfZdCuhq8udrfZbd/hDKI6Fm2m3y5jzEBT7Q/2Wf55BZT85gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR2TJaS2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ns0knlWF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdvcY2510949
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Lo8pgHVw8dr8EhYjzI7pSrf
	sLgQ/Biprz4uL3xaU+Y=; b=QR2TJaS2SX2+bZ06LYZB+kyL6ZsJHoBYyRt26ndF
	EqxJ6TbUexmudm22+NW4hSFiazz+gxOtPd/8Vrc8hNetPds5pi//jK0Mr7K4ORyQ
	QprkNriUo803wEaMuXf5802rJPLjJ+YRaVu9QGfB9R5HguFvM/je/BdFG/o8hRVy
	kvkKzNUKDkbFRpfXyWSSaLfDv3UfW77O46uDoA6xpZLnEqSr7HGQ6bQSCr5djZ8k
	pk/YhY7dEGH59b0pIhXSexz0ErfVfQRxhFP4LUSTG4+CffCeZLCp/fvZQV1KVRAa
	IcGziadAIwfuyYPTjLr6dMSgLPEFE4uUIm0RZixq4dfWkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jg85ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:41:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so465775ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782402087; x=1783006887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lo8pgHVw8dr8EhYjzI7pSrfsLgQ/Biprz4uL3xaU+Y=;
        b=Ns0knlWFyms9uicQv4lzD9GLBp5oJpgGN0VwEHuqt6u+DFHdD+gAqSFGBfI39rx3ON
         RbPHwInSNVkmcuYf5QZvvJBruz6Gp2MM9uReuPfcHHhfWQnZm8q+ZovXi59OJ5Ji+mal
         9tjMbUDwwTRrxkEwd/h+7MaquLzEWdJusmEsnoO9Spbx8HcwmzFWRo3lFkFuWWumPnbc
         gGC6pavbNPVu23tDTG0W2E8H/860s2x9HESIOB2lvTnBpy5VbDh9RJ9X0/vORGd9gB9U
         LoogWiuAGs4+0C81wG2YQx3y0i1S8yPJJ0xdI6r+S+zqoWx60PSyLV396r2jbqdws+WT
         v70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402087; x=1783006887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Lo8pgHVw8dr8EhYjzI7pSrfsLgQ/Biprz4uL3xaU+Y=;
        b=bLibzCWVwBZ2FoLl8iNOkNtWGeJ497Z2PLzgs4C2Zzp65NkLBzLfog1vHplXzcpYKp
         klJR1M9dwsLft1z6gVK1JO/cjAYQxuzA9jomblfaY+cHU0GXJ43HcT1H+bspEgrHV/PA
         2VYEyFevAfBGi2mj2crCZBKRIuaK/+mmn1SpSQnJGzHggk17cx8Wh6NqNj2H08RjwEOT
         kKx6ZpaSzNTYcN+ZbfAIdGYHZqP5tW6kOo9bQNC81hXjSvFulsIEnUyFRYSWdIhA94Iy
         9cA4U5+e2yr/+kjqslEs9gRBlfM8Qe2vU1Qfs0yban4UlTbc/EPmHv9PN/CE77bkUL7u
         hy1A==
X-Forwarded-Encrypted: i=1; AHgh+RrRDL32/RGarkJ9cv7FAf8NJFNuNC4sLQcgOOTIm1d2/bUyuojCU5TvbxL0zPKQmqWV1nwnmNtV82oRldeE@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7VOurgaLtJo5SxGq9KyM7sH4iXHbO9yBFqQM0cTj67/glhNa
	bDoBHPYQdyfBVpY/6RHxCYYE9O9asWSgb1XZ0GsXfuxiVNiERlijuzH9Bn9qXZeVRwzw+9iPSsd
	WRBykki1V9gutZT7XjKZN78F77Koy/GpiIlPsxuhVpWNufFJ81dHyUbdI61JZ4j3R2ali
X-Gm-Gg: AfdE7cnmLmjIHxqQzqzkqqIjbYIAiZgM63nUsfwaB+EtDgdJ/VjsznnoCvxMaAvX4mp
	b84RmtkqyQ2pQNA6sTYeXAgYtxA0daoytKVBphPsDU3VbfvP0kJ50TuAUn3ocVJQj3ryV4nDGQZ
	FEFPUbx6HgasFtOLL3F3Nz+giUVxgUXRoglZhJK/PqSaPTFw8PRfuKxcLIXVW3+howGaLfzLGSP
	pKPlzTN6hDCFNfLEGAQhF3tUpavqcC+cZS99W3pK+uVZ5qkBmlxkj4bwjJjwjC0ZQZClTeODCn8
	LjEjoy4LV8bGs9qLZtf+190TcMa3+wz+ZDpTF8rkxNhkJXWr70O1oL13G4HeqNJ/fKVWHZzaa0n
	yajM21cFanjxNz6MZmwsfJZocc20I5HI/2JQSKy3A
X-Received: by 2002:a17:902:d482:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7fc74bd33mr30863285ad.21.1782402087107;
        Thu, 25 Jun 2026 08:41:27 -0700 (PDT)
X-Received: by 2002:a17:902:d482:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7fc74bd33mr30862855ad.21.1782402086573;
        Thu, 25 Jun 2026 08:41:26 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac88fdsm23947525ad.17.2026.06.25.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:41:26 -0700 (PDT)
Date: Thu, 25 Jun 2026 21:11:19 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNCBTYWx0ZWRfX47p8c4Kr4uMT
 IWAbFAsO9uBbookyVeBUDnseZA9Crseiam18u1cjq3x0ln4r1AEWWDn4s/4a/ym3r3ut0VMuf7V
 BEnmYvYkZuLXJvDj5qRt4PE6ykN2iyx/BkBR/vtMKH/Rwa4aqk1IYk/EvI/u3wauh9fA9hZF3J2
 oYWMCXBQ5YZJevAi2pWB0VCt1rWjUM9SIAuz+ZME+O1tDZcWd9KWJ+h+KIx7dAoJfTncUrkefYS
 mNKg0pDD24n2cOx1C/dVcMGCGSxeD0lPLj4ENpNtIOl0zGoDo/vgo8KK2vdtu7Fw2jDPjO9e1eA
 bFVMzLxOca1rP6HwNst79WQJRrTu5zUgj5a6/41vKZpxRngjGpw5kC56CvGrsRwnCUw7b30hRZx
 RbQkc8zDqW8IZ34YvfVYWj4AMihmQgAjdu+6Dp6w63qJvAuQIUTnXbnqo0PNij/W4GfrLM1mptk
 Avgy5C6JmoHTgq7Pj5A==
X-Proofpoint-ORIG-GUID: 9zD16pSZxCuO3wMwjb7FxVlSa09S2G3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNCBTYWx0ZWRfX6QHGlK6IARnQ
 msmn+JpQdBjPqu/j3JPZkPRWGFJSQXhl49n5CaGfT/HRTbrmLgrQyRblIyg1VTa8GovmuObW0qN
 D6ucSgYbnFI/n8OSlfgmiIbcL7Xn1eE=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3d4c28 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1JGSnXlUyEB1KsQKyO8A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9zD16pSZxCuO3wMwjb7FxVlSa09S2G3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pyspqky3u6cn:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB8886C7252

On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> <kamal.wadhwa@oss.qualcomm.com> wrote:
> >
> > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > --
> > > > > > > >
> > > > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > > >
> > > > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > > >
> > > > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000000000..401e71720519d
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > [ ... ]
> > > > > > > > > +&rpm_requests {
> > > > > > > > > + regulators {
> > > > > > > > > +         compatible = "qcom,rpm-pm2250-regulators";
> > > > > > > >
> > > > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > > >
> > > > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > > > are discovered later.
> > > > > > >
> > > > > > > This can be ignored. The compat is a leftover from the historically
> > > > > > > incorrect naming.
> > > > > > >
> > > > > > > >
> > > > > > > > > +
> > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > +         };
> > > > > > > >
> > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > such as vdd_s2-supply?
> > > > > > > >
> > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > >
> > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > downstream components?
> > > > > > >
> > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > >
> > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > votes are cleared.
> > > > >
> > > > > How is this different from other, previous platforms?
> > > >
> > > > This is not different. In the previous platforms too this is taken care from the
> > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > may have a RPM/RPMH regulator as a parent.
> > > >
> > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > calculated based on the active child rails. This was done for all the
> > > > subsystems (including APPS) regulators.
> > > >
> > > > So no explicit handling from the APPS is required for parent supply.
> > >
> > > You are explaining the driver behaviour. But the question is about the
> > > hardware description. If there is no difference, please add necessary
> > > supplies back.
> >
> > I understand your concern about descibing the parent-child relation in the
> > devicetree, and given that we have been almost always followed this for all
> > the previous targets, it will expected of us to add them.
> 
> Yes.
> 
> >
> > However, we want to avoid the unnecessary access to the parent from APPS.
> 
> Why? What is the reason? Do we want to do the same for all the
> platforms? Only for Shikra? Something else?
> 
> > At the moment, I do not see a way to avoid that, if we add the parent
> > regulators.
> 
> That depend on the answer to the previous question. In the end, we can
> make the driver ignore the parents by removing them from the regulator
> desc.

Ok, this seems like a good suggestion, so you mean its ok if we define the
regulator desc's supply column with NULL? And only keep that in the DT?

you mean like this?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453

(please let me know if i got that right. thanks)

> 
> >
> > @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> > parent-child desciption, but avoid accessing parent supply from APPS, as its
> > Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> > recall we had a verbal/offline discussion about same concern in context of
> > RPMH regulators earlier).
> 
> That's why offline discussions are bad - you can't include other
> participants in them.

Yes, i see your point. I will take care of that in future.

> 
> -- 
> With best wishes
> Dmitry

