Return-Path: <linux-arm-msm+bounces-87631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B1ACF6D33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 06:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA3A3018F45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 05:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED922DEA77;
	Tue,  6 Jan 2026 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fM3e38tu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCSvtNRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D829C338
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678959; cv=none; b=oyHl3P2McT2yng4AQFZHpOo/s+b8NYE7510T3Q+4A5Wh788q0tC3/SNObCmUFSrwsP/pDpNFjnTVoAuElPIvB3TEEq4JKEiG/R7VGTbwfupTdprqXaZFOVWlUzoWo1wIl3Onijn7F9NIeMldrcw7+MxERRcUV48lEJ7sqrmTFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678959; c=relaxed/simple;
	bh=rt/LoXHXTMlaubi2OtDu5txWrkRlBcz3naFRv0gOz+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drJtCyoODQZKM7RGt4mu0TiZmnegkfYi+Kjs7FxYi4k2ykCYIQ1xCbHYdaDmq97I4VwJ0yvBxNgOeSol3Hdj7ctcGhrMo8yTRLpKyPbNQxO2lxwTYP+3jaSAdaD7npK/FTRUO5DqXF15whIyk28FiK99nJrGWdp4sPgV9E130Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fM3e38tu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCSvtNRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QacM529218
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 05:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/q01XhRxVgeVnOfeWGaC7t9O
	fwilPcF4MbNkT1jVGw4=; b=fM3e38tuPq8eNzH7IGqgaOcFuq1Ld0sw5pr/PtWh
	Z2Hgs7Y3vn1gYCd1svr6f9FRy1N7haoDLWgoJGz78yaiErdX8gSgAL4So/wjRHUY
	Lpyufyt8VlqtnXXBnwKmgMotHeNfNpUQvPInuzamCV/g3s+5AKRJ14cGTJZum9rS
	ahGH+5X0qMA3oGG8P5Lq3Q+raFWLNlDyBX6Bb7wOQ41QRAlF/ekDKbeNSKaDdKEZ
	VNUqHWyzuLNmPE64G59VKbuNy6Pc6zJQagrzdVhFBaaTVO5aSuoUKmxlr+zG2MNY
	t/0eyf0+9eT3kD3k9wwzQ6eNHaSTqnc+dDfCF5yNBQvODA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu1yr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:55:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso2230177a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767678956; x=1768283756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/q01XhRxVgeVnOfeWGaC7t9OfwilPcF4MbNkT1jVGw4=;
        b=aCSvtNRJULRXkCKjPoY84ip/lyzjCwtOGgRFx4SDQqTt84MSoNDRn4H/NKRQd067I6
         HswQI30Bncth3qBFgIdaxJQ0MwNUEtpDJYbsH+s3DYzb7uKRJCoSpxugOGdfX5QqnolF
         5o7psJyOPBrqJLIMWjRiWWRJfQ3oqRGtniwFCAZUO+cVerhvODMp25UTbU1yDFKa5a+q
         YvUJDN9Ef+zv5l0Aed+LPFGh+YAV4sEz7Rp//5OvDAIOAjYatZq3oJ7WWY1rWnwWVTp4
         E+kU9s1EZMN4IJR1G99s021+rV02IzdMC8RBVNwJxNmVMJAPPKfGHT9G+DJUem50/KP9
         fWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767678956; x=1768283756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q01XhRxVgeVnOfeWGaC7t9OfwilPcF4MbNkT1jVGw4=;
        b=MkYiyNcUbrylOtAmV9oVxVgNYKVAl7BAD8g3BSlljeTYcNml6Fx7byvvV2/J1uDcUN
         hTbZnhTMtz5ugfNqM3BmhI3QciSLHdOFBv0sduFe9S0mwAnwoGDUSy01A9sKj0mQ2SC7
         1H3Kr5hH0NzUKtj97u8zgWhUnjg9+H2li3dV/Otw4OuBrP4Hv+n7n2+o6GPWh70geqHC
         30vNOuYKZhp3wA8JMsq0oz+unODV8pQ8Ue7Y4CmRafKDllmI0BqavkmDN/+l3iYGDkxO
         pkqe7FVrlduxiMkFrYS+gDqaLy7t/aMMDgXPgMU9wEVJ5o94olYYnpnGAc3+IcN+fvJX
         9iUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWxWfZfnKOBfR6+9MdsJnuOh9YIDmkNXx4kxzl1Q10HlQuohUDzzj+i1dFrya9Z6QzIhd0TTo0Je79Zs0S@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOElT6kNUqunwJRr19s6c/kbhjsAvpxEvMQ4qpIZYYsqKFYjP
	B08JEwzYOZsdQbFzuuNuxJbDP5L70WUIydSHsxD3LwKpTqP23UzevKH9JTwBU5e8KO4UDetjbl1
	hB58K1THKnfiEaTDYLofvF62yAyYSNWdTnX7WY7K72Dy8XZdUIPWZp4mLS76/lkuy4wLH
X-Gm-Gg: AY/fxX7hcYYBfEmOfAdVnZ4T1dp7K+cNDaSo69GklahwC+IySqLyRp9ydJYRzKpFTlJ
	MyuI9dODeClUp0luznXHO5e4B/wjBQ84a08AWchjHN3T0Oc1NBRDffhda7DwCaeFBaDo4kIj5Eq
	o5ltG8Psfy+6ktH4G1UmHFpanLy34obE2u9zy/uV9HdAgkAqFS9YF04HNGIwM2HudO5H/XfVxp1
	e2Vpc6AsduLAUDku4qosWmP72AlbVtE4SoQhy9bFumRuxUmyUh24uGffSIGykYAkpBLIeM9SNxK
	scjacQI00jsa2IcRPmT7H8t3otNd7hQLxZ+iZICOhmJ+5b2H+ZTFUcfW564CPxjZS6+SfzpJljA
	dWKFewK3hHrK3UmKXyJv9npOdJXQfRBiWmbi2B7jSX4k=
X-Received: by 2002:a05:6a21:7486:b0:366:14b0:4aff with SMTP id adf61e73a8af0-38982b715d1mr1734116637.38.1767678956162;
        Mon, 05 Jan 2026 21:55:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDN3Pd20TtRRi017rdEF4LM4VhLCzP58V1UhTLFTEXu903JedqbwdMGPxflYM6oezPUSGUpA==
X-Received: by 2002:a05:6a21:7486:b0:366:14b0:4aff with SMTP id adf61e73a8af0-38982b715d1mr1734092637.38.1767678955647;
        Mon, 05 Jan 2026 21:55:55 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28f678sm1171577a12.3.2026.01.05.21.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 21:55:55 -0800 (PST)
Date: Tue, 6 Jan 2026 11:25:49 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
Message-ID: <e9e7dbbf-f7f0-4b66-9e3f-7578441dfc5a@quicinc.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <6a8f5d62-f6ea-44b3-9baf-acfbc1e58efe@oss.qualcomm.com>
 <992d46b7-b053-4a9e-ba04-f5653525a891@kernel.org>
 <43e48560-2848-4474-b858-a3d15944e2ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43e48560-2848-4474-b858-a3d15944e2ee@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0OCBTYWx0ZWRfX9CaYYzczjP2U
 YFdceupKCv47MYqfRDwosmpWszewi3WVNeMzBsyiS5maNnRSze74I/d4fru0Q1D0DpRscVL/Q/v
 giXaMbMkI9VyWcYGnPYCD531sJ4OxfurGL8vMm1WG/LyXFnoo0zISOvnOzYKuMfnAzfmBkEt5NN
 yWKoaUw8sO1nNkaxO9a+fQ30Z7jYAPB16pgcItR/l38D5/9blk7o+SbQCB2tyq/PNRnI33dYAbX
 unFsCDVhXANNdjP0V4+ZLKTxUf0gWqZWix1muOWrzteFlecOXEX7Zs3VYfWoVykHib6jNzYYLQP
 NE4M7TPZDu6RfxBCyDHqY/Jv0wZdiIVFEaFKVPX4EsUMcaQAPxPBwyNEiKHb6fJ/LhfeINm3kDb
 CHHpga+ShLeLtu3Z6j+HmNm2aA/pCLG3kfRpfaLQQC1zgBK43/z+6Oko0sUMRhs0sCvIBnOGfKB
 0RWpwH5c8FoHgsd41rQ==
X-Proofpoint-ORIG-GUID: DrdwycbMBz7WP41QXsCab-l0gBRz3KgD
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695ca3ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=H7LiKOkp3v_ihm3-CiIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DrdwycbMBz7WP41QXsCab-l0gBRz3KgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060048

Hi Bjorn and Wim,

On Mon, Dec 15, 2025 at 06:30:47PM +0530, Hrishabh Rajput wrote:
> 
> 
> On 12/2/2025 9:29 PM, Krzysztof Kozlowski wrote:
> > On 02/12/2025 12:23, Hrishabh Rajput wrote:
> > > Hi Bjorn, Guenter, and Wim,
> > > 
> > > Just a gentle ping on this series.
> > 
> > It's merge window. There was no point in pinging just before merge
> > window and is even worse to ping now. Nothing can happen with this
> > patchset and such pings is only noise.
> > 
> 
> Thanks for the guidance and apologies for the noise created during the merge
> window.
> 
> > > 
> > > Since the patches have received Reviewed-by tags from Dmitry and
> > > Guenter, I wanted to confirm the merge strategy.
> > > 
> > > Bjorn: Are you planning to pick the QCOM SCM changes separately through
> > > your tree, or would you prefer the whole series go through the Watchdog
> > > tree?
> > > If the latter, do we need an explicit Acked-by from you for QCOM SCM patch?
> > 
> > Where did you document dependencies between patches and any non-obvious
> > merging? I open cover letter and there is NOTHING. I look at patch
> > changelog and also NOTHING.
> > 
> > So if you tell us nothing, why would we care to think we need to do
> > anything special here?
> > 
> > You must explicitly document every dependency, both external and between
> > patches, in the cover letter. At least cover letter, some people (e.g.
> > mostly me) don't even read them...
> > 
> 
> This is a miss from my end. The following information should have been the
> part of the cover letter:
> ```
> This series spans 2 subsystems and is split as follows:
> - Patch 1: QCOM SCM - Register Gunyah Watchdog Platform device
> - Patch 2: Watchdog - Add Gunyah Watchdog driver
> 
> Dependency:
> There is no build-time dependency between the patches, but Patch 1 is
> required for Patch 2 to function.
> 
> Merge strategies:
> - Strategy 1: Take both patches via the Watchdog tree.
> - Strategy 2: Take Patch 1 via QCM SCM maintainter's tree, Patch 2 via
> Watchdog tree.
> 
> Since the patches concern primarily with the Watchdog, I suggest we go ahead
> with Strategy 1. If this is acceptable, I request an Acked-by from QCOM SCM
> maintainer for Patch 1.
> ```
> 

Is it possible to pick it up for v6.20? As mentioned above, both patches
don't have compile time dependency, however the QCOM SCM patch is needed
for probing the watchdog device.

Thanks,
Pavan

