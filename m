Return-Path: <linux-arm-msm+bounces-116991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ZZ5EBr/S2pceQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:16:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC7714DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:16:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AJA8k54f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BxNpl3IL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E87C303814B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF273B7B99;
	Mon,  6 Jul 2026 17:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B303B7778
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:40:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359659; cv=none; b=gSHvUOKXsktrYcXtFEAQhZ5E4el8PjCeWiYqhAlQ/5bsL4VzjeSRgRpescfmGuydWT55rbOb4jlfy2VCHTAvlD5+ZiT9TV3TqalW6HfXb0t6kKbTgJZmv9VmwwLV7e2XsU1/aE8W4Igkxg8nB0Agr0Uh+SDVLfmCe8GP0z5KukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359659; c=relaxed/simple;
	bh=OvFx/BHGByNlAvrPh8fCXX9atTRj8VFlDgNhze5sYFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4vBlqWHIh/CnJUY/tAmxjNnDtYa0IHwz/OBqqkMETrZvWh0CLJ2+SwNIfdV54J1RS7KvdFu83YvMxcSVG0PMKVJxXAO+Gdu91V15kt+YaACGFfFrjVW89hNs7FgN7wygakO/aYgfpkPxJ0S3yrmZ1RDddNy9sjJvLRABHj/nGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJA8k54f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxNpl3IL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBEk972248
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/FW7h8IeS6yPhuHUmuiZkT7
	rFpwulK/foFKldJ+TkE=; b=AJA8k54f42eEHtLlS9U0tCuyF/lDpgaSm+Ph4dmL
	Y2+d16UStpZXeA6xw+t04DTWYM1lPGWJS1vh32jfCSssCaWqILlhyoyoZZab5r41
	xETAO87nna0gkmQq+4267kO+4tA3scnBM3oLyAk90E6a3eEtslEWIKmtJLpTbu0b
	+vE1FPNjA6M30cDXwr3mud4Ka3zuTTqlAIIATG/FuWsUA/W0woPzhYIWat2oeiEf
	D/ttXsQMlP+OCX4GlkK2qcJD3UDGAasvlS4h/azxnaVUcIkWuvZZRhnG/aDR1z59
	m8IHLwrFWnx382/z2E38jDHAd5khSFiE6BeDiKkxp9SQzA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r23v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:40:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdc8169a8dso3760939e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359656; x=1783964456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=;
        b=BxNpl3ILBR4sxKB6QcFRvsk85VNWjZveWG1wO+8PxZwpnvrAWFvnT1OO2RUZte3ZuP
         hh/IJGz9EbaGMWeCfowmeklY10z1PP2z6+Mz/toi3g2OSYFrjAFB8XivDbq8fp555Gz0
         oBrnPLHl2X/oOuOVlQm8OrB2RjZDxeuo7mu/fuuRbR8V8PkQx+kbNAql6ySvIzOZ+eab
         +l4hNUhc7u2VWf5q+6kYAyjjcoM8amh9ToOI0E7StEh26ZCCYtqBCTuGeNcPhO0CHM44
         jQymxFhsKC/v82s6xkFSLW5BZL36VjW3t9jljALO0ExUDe7a7PNPNdFGfqspg9ljPeVN
         y3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359656; x=1783964456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=;
        b=K8RBfXDyGda0l/mAgaUz4zIpGUg9fTGJUxvgR9uDmrFIbwtRrxLI4W7N6s/Cin5Gyi
         P2dIjWd/W5Srb2yaEsjCcfF0X7XUs4DqvNMFAIJ3/WKl5SCzQNAOW48da7mIDutgxtXA
         FZIsRZQGRV4tOIo1FQgd+issrXBcxhTtOwOa/BT29jQCoUGaS5nKMDjg6tY5rwSpzHqa
         sui75gP+dhac2DDdcUUhIlwtL1/6X2/2gyV2UlaLknRSQLCXxoTjVxyl9jzrCMPdQipy
         Tw0zApc69Gf04lUbpem/2H1mN0xHyW961UfasebOTMVjm+9auy3AHjV5yFkQ+K7a1/Tc
         LrYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6ZTeWvYklKrNj43pbcRujwhB54jUMCsJKQXuarSZh7AZhVy0V0917MToWsG9Pv7NCPOvTywEkKLgz4ZL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+xXEASZIwBC5K9WpdM4t/mEeXpxRCdtRCib5VS6NZMpXo/Oa
	SbjwFRklwn2RD5ZF72/sUimQImdDGJpXbzhbUC+Rtt0OoveKuKVQCiSVr1dkUWv+bg+0/5JGbup
	V4yWShTeoPYPUAapuD+wKsmapvjbOh8HzI2tyqxpQIJYT0IOM98+HNXn1JkULGYOmwnUv
X-Gm-Gg: AfdE7cmTX7i76F3u+jzg3kux5dZ9o0fw5t49K0txhzWSoKcRLhceoz8o5OFj2vbp10k
	p3VM3Cuc4+GAcQo8UAuojCqBYhawUR2o0zuyLAyHZ6Awo39/0c+NaD4F3J+ZOXg5oTzcQ+NOGGs
	IOBmQgUPh/NQCy97OtBuqJWU5Rquz8RVTPa16yw+QLwJoI/9X0NYWWuIGH47THSee2Gj06s8tjq
	T8jF2krwnSk/Rz/oy8czT0vd0k40GqezhxZTu6+Gbl3c0fbdafPhuebB9h/7BGB1New2nUeGYXe
	YCjEs7PaT+xqaz4FawJVxI7lsb8l+UVEKevEYDY2XCnpOQh4X2uqG3wLWTZnLvG544MvdbB124f
	E+ASmYfmaE69nC1hwWzs5uQvZtBmmGuJJkhKoPeQpOXRIBC3tzmikybgzES7Y9fFe5ckQCB9hAD
	cQGtCKV5xtMa2lKRQ35LfXphsk
X-Received: by 2002:a05:6122:a0c:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5be90860c25mr995163e0c.11.1783359655793;
        Mon, 06 Jul 2026 10:40:55 -0700 (PDT)
X-Received: by 2002:a05:6122:a0c:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5be90860c25mr995141e0c.11.1783359655331;
        Mon, 06 Jul 2026 10:40:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm3034362e87.36.2026.07.06.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:40:54 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX1VwiKnsXUHS8
 jAOBHd6WXF4fuwu5JeJiqqESbyQ3sA2MQzzqmRIIAAl2AkxS6llNBEqd10IxTEh5IESlpnFsn4e
 SXLIuvBNep7fYW2X7+z3APX2adiAmUoolReT/XFJHK+81bEfV+O6WuyCKefACztqQahOIrcPtz6
 Xz/0KKQ8woOov1f6wrdGEFPPqo85m8o/PQfpT/6cSq1tYqCLm/LkngUQPeAyF54WNLuhUiDpbHK
 sP9ttt5Dt18y3kQMNIizohQItXVVuzW2/u7lqMfqv5sp/OTwxqpItHegZJgarBatCHYHIkoVlAu
 a2Xx4AfRlshr8438DE3KSjmEeOQYWcIczyoCKJ/fFLNi+6kz4DwD+QpmgoDxu93k9g3WOr5/Kve
 vnkv1RkNTCYlm1RCSEdcHET60QbiJZvrRr3N/A9hy/gtp7f97dE+vMSS6pUFI6vkaO5tnj0rOth
 pRUmxZfpsDz6La6LuQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX65LgICtcyNZP
 TC03YRXaMvKa4KxvU6rA8FQ89NZPeQtWrQNfW5oeFHdZHeEGNLBKxIp3as3qnRGnDadySqNLxID
 jG1/5cHgOeizpP5TJ0BeHjFw/zFAUsQ=
X-Proofpoint-GUID: wwYoBMJ9iBfi4JktNF3fsyOAvSMfy1_n
X-Proofpoint-ORIG-GUID: wwYoBMJ9iBfi4JktNF3fsyOAvSMfy1_n
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4be8a8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=y9Wl6y6DRnsaoLG14jUA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060178
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116991-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,u54exappwjes:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FDC7714DC8

On Mon, Jul 06, 2026 at 10:26:35PM +0530, Bibek Kumar Patro wrote:
> On some SoCs the SMMU registers require an active interconnect
> bandwidth vote to be accessible. While other clients typically
> satisfy this requirement implicitly, certain corner cases (e.g.
> during sleep/wakeup transitions) can leave the SMMU without a
> vote, causing intermittent register access failures.
> 
> Add support for an optional interconnect path to the arm-smmu
> driver and vote for bandwidth while the SMMU is active. The path
> is acquired from DT if present and ignored otherwise.
> 
> The bandwidth vote is enabled before accessing SMMU registers
> during probe and runtime resume, and released during runtime
> suspend and on error paths.
> 
> Generally, from an architectural perspective, GEM_NOC and DDR are
> expected to have an active vote whenever the adreno_smmu block is
> powered on. In most common use cases, this requirement is implicitly
> satisfied because other GPU-related clients (for example, the GMU
> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> 
> However, there are certain corner cases, such as during sleep/wakeup
> transitions, where the GEM_NOC vote can be removed before adreno_smmu
> is powered down. If adreno_smmu is then accessed while the interconnect
> vote is missing, it can lead to the observed failures. Because of the
> precise ordering involved, this scenario is difficult to reproduce
> consistently.
> (also GDSC is involved in adreno usecases can have an independent vote)
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  4 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index e2c914fccd6f..5133d3ab023a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/adreno-smmu-priv.h>
>  #include <linux/delay.h>
> +#include <linux/interconnect.h>
>  #include <linux/of_device.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/platform_device.h>
> @@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  	return ret;
>  }
>  
> +static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int err;
> +
> +	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> +	if (!IS_ERR(qsmmu->icc_path))
> +		return 0;
> +
> +	err = PTR_ERR(qsmmu->icc_path);
> +
> +	if (err == -ENODEV) {
> +		qsmmu->icc_path = NULL;
> +		return 0;
> +	}
> +	return dev_err_probe(smmu->dev, err,
> +			     "failed to get interconnect path\n");
> +}
> +
> +static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int ret;
> +
> +	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
> +	WARN_ON_ONCE(ret);
> +	return ret;
> +}
> +
> +static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int ret;
> +
> +	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
> +	WARN_ON_ONCE(ret);
> +	return ret;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_v2_impl = {
>  	.init_context = qcom_smmu_init_context,
>  	.cfg_probe = qcom_smmu_cfg_probe,
> @@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>  	.tlb_sync = qcom_smmu_tlb_sync,
> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>  	.context_fault_needs_threaded_irq = true,
>  };
>  
> @@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>  	.tlb_sync = qcom_smmu_tlb_sync,
> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>  	.context_fault_needs_threaded_irq = true,
>  };
>  
> @@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  	const struct device_node *np = smmu->dev->of_node;
>  	const struct arm_smmu_impl *impl;
>  	struct qcom_smmu *qsmmu;
> +	bool is_adreno_smmu;
> +	int ret;
>  
>  	if (!data)
>  		return ERR_PTR(-EINVAL);
>  
> -	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
> +	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
> +	if (is_adreno_smmu)
>  		impl = data->adreno_impl;
>  	else
>  		impl = data->impl;
> @@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  	qsmmu->smmu.impl = impl;
>  	qsmmu->data = data;
>  
> +	if (is_adreno_smmu) {
> +		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

Move this to a runtime hook to be declared in *data.

> +
>  	return &qsmmu->smmu;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 8addd453f5f1..6835b40339ce 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -6,12 +6,15 @@
>  #ifndef _ARM_SMMU_QCOM_H
>  #define _ARM_SMMU_QCOM_H
>  
> +#include <linux/interconnect.h>

Not necessary here. Just forward-declare the struct.

> +
>  struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  	const struct qcom_smmu_match_data *data;
>  	bool bypass_quirk;
>  	u8 bypass_cbndx;
>  	u32 stall_enabled;
> +	struct icc_path *icc_path;
>  };
>  
>  enum qcom_smmu_impl_reg_offset {
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3..a27804e15738 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		err = smmu->impl->runtime_resume(smmu);
> +		if (err) {
> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +			return err;
> +		}
> +	}
> +
>  	err = arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;
> @@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  
>  	if (pm_runtime_enabled(smmu->dev))
>  		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>  		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		if (smmu->impl && smmu->impl->runtime_suspend)
> +			smmu->impl->runtime_suspend(smmu);
> +	}
>  
>  	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>  }
> @@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		ret = smmu->impl->runtime_resume(smmu);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> -	if (ret)
> +	if (ret) {
> +		if (smmu->impl && smmu->impl->runtime_suspend)
> +			smmu->impl->runtime_suspend(smmu);
>  		return ret;
> +	}
>  
>  	arm_smmu_device_reset(smmu);
>  
> @@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>  
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>  
> +	if (smmu->impl && smmu->impl->runtime_suspend)
> +		return smmu->impl->runtime_suspend(smmu);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 26d2e33cd328..ed08f86cf99d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -455,6 +455,8 @@ struct arm_smmu_impl {
>  	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>  	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
>  	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
> +	int (*runtime_resume)(struct arm_smmu_device *smmu);
> +	int (*runtime_suspend)(struct arm_smmu_device *smmu);
>  };
>  
>  #define INVALID_SMENDX			-1
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

