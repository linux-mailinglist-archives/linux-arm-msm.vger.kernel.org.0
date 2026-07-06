Return-Path: <linux-arm-msm+bounces-116992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XePeLETqS2oCcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0D7140E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PWSQ74IS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CQqr0oHM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116992-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116992-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36F00300F792
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9BF3B2FD6;
	Mon,  6 Jul 2026 17:42:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C53B4EA4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:42:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359750; cv=none; b=rWpuxnpiZj604gwLxmAXq6BeQvtnYyy44c+gXG0hRMOzz+lHWiIkRDtkatXVz9gyQPH+iSspCHbvbTLciIo+8NSQMwbl36Eu6CMZM3hBpdscu0OxI1qVdwzNo8RE5kT0qiSrIHXVvR3I4TMezCKKL6CyYCqNn7af4b5jcuk5yMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359750; c=relaxed/simple;
	bh=Q0hgKfMIGJ8oQlA0BCvlI9Wzx1l4ehDdzg25X2t6qEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oV2UDjZrsiEJ+IsMeVurw5q0AQ03nREFUPgQi1yg2BJrnHsW/zqk2F7dbEWs1TrHU9RkSntIjpdh3JLG5OPiekD8vljY2YY9ZyiJfbkdyJklFWkNwIkWgtlP7ePpZE0bDxiAeE6ts4b6ZPvazP8frOmcI9+Ibx4yV7H/JEjV1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWSQ74IS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQqr0oHM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7cX900706
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wZzheGRlsfoWHphf+vMzevyb
	nf7yYRErojFNsdmSejg=; b=PWSQ74ISsra20N0G3LSYA3WMfBSwhAUFaTIdS6Kd
	s7b7U4sT9uJgx/4zLi6Gh+/pDZeAlEpdi8DxP/0Ag/rvG0QAxqFyNzgsvelXXUBl
	KacXcsVNei7i3mZ6PMzcDyCT07PKfl88Y6vHgIOfT/pglQWDqqXV47vP/g/g+8o1
	zGDFxFHVSMPFDOLslQH3DFqD7tD1BvBUnb4MW99E3JRC1Zct9fOgJjhHyO2w0R8p
	4MeC/MfzDfQwCCL+q2dINDgbKX4SfVA3/SPer2vel1P2vzpK3x87pmADDeL9go/l
	oAyLS3PI/H5ImY8q7BmgOQeEOf83kFzBZ0jvrfhTRcPBLg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jsux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:42:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so4865353e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359747; x=1783964547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=;
        b=CQqr0oHMBKAgkshrXeLNbiJS3nxMA9rta79B1bqvyjvx6tXpgNcUcISxIzb8etapJY
         Vhv9GWjIHgA/ZWwIvAATvUXBCB4QPasDlw/xvNO2wblsZfmqMfzRolPHlBH9IzPkOFRy
         yLWhgnD9XCbbxMY1Z31BpySgXcf3TMKiwEa3Ud94C3w5yTsJj4KAJxHabqzXn2Ojo6tZ
         wISNwYXvwaJdfTzM9FWwWdVhtmy5uGwsTwg84vrAEHuVaIzLdJACRo/G+D+WKCqBqjYH
         0Vpd5j3Run+3KhdnC8RO4maf2yb2sk/tJlDRwpMhWgJE7IWv1KnJYHiXCjNyRINOxZOg
         2ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359747; x=1783964547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=;
        b=iYvogilVXflB3Ohh04vlYX9l6ZqC+5GxAO4iALT5qFCRu1qbCKT8Y4cIel1SSWJfbK
         oEd0+6Ors74ar7Zh2yr/zQiPDkP/pKkZlEGQ7Cx5fjeX4zJce/J5I47ZSO3QPJnv/jB+
         0pTIYjS27YlRZ+lxeHYWqG7avXBQBsb/4i64cdKJi/K1/yExFWN8oJJW2DmUOqqmmfeG
         BvkZpltNJhluuR/gAxBgxXfaP2iicCvhH3Jei+DMLtCOd5tYyVXlPGzV2yZKjOGzHdTw
         aOhmVPugX7w/uJmBd2tr2ClwqJEdKDD+R/eqmzy2LYb01qpaULDuII+n619witN8eLgA
         jJyQ==
X-Forwarded-Encrypted: i=1; AHgh+RooIp1ZxutRRcrx+ZDJ6RYt545R02fMUL+FwqFnV1VjP+YOJV587vS4uLA4dfOefL/Axu5FkT1vcaSEVK2p@vger.kernel.org
X-Gm-Message-State: AOJu0YyTdLJWmUWxhlMeLIZ4YxlcOwEJ4y6VjaS+TIVhMQYELnkzDy/C
	spICyADAfY/a+BlzcU1vozCsFHURFdP4ks6FETXPlzxaRQJLd8QM7Aryg6H4CWQ9iS3XAjydLNa
	UVy5soRDPH8wfyw8U4sTnBkUrtcPPO6NAEiiNpbBGoEVuR7VVWvF2WP+Rvaldx77CjlFd
X-Gm-Gg: AfdE7cl35JmjicuBgq1jnDL5bCOmyoVuqAVaX9TptdEmo/gfKjl8QmLKe32uj3t8Hhz
	X1yKGqtmE83KJtvKrNBH+vEkVM9BWa3tfQQM5NQSGI7+gwRYHwo/JACv5CBxVzb4sA7DNMldMb1
	4GhCwrnHmrjzu33HC+ttj4HVbHbl+kh+YUyx9nc5/IZRCxS9sGg5lDZ0qvCzqxiL+VziW2wQ1xt
	byQX42zJ1CW1TOcEa06K78c27Afq8EOKN98egI/1WBUHSLPF9UIjD5bTIMhjdFialKPbpxI2b7D
	HyUp5l0xqaANoTvh7H4FlgwtkSSdSJIVSy4pP+KsZKKJWLDPKKpyWE4vw+2126Cipd/3DB4Dj7p
	L8S9TOIzwKyvapDV6YMAWMDxF5jKpAc0yu2M+TE3x5aJvTMEO4hXHdp9Td2VMVVj67JPEnWLSgm
	Cl+oSosegPAJguxKS2xRA/HwbK
X-Received: by 2002:a05:6122:32c4:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5be8953a62fmr939552e0c.0.1783359747093;
        Mon, 06 Jul 2026 10:42:27 -0700 (PDT)
X-Received: by 2002:a05:6122:32c4:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5be8953a62fmr939531e0c.0.1783359746659;
        Mon, 06 Jul 2026 10:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c1asm3007595e87.81.2026.07.06.10.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:42:24 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:42:22 +0300
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
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX0jOI18hqwZ7L
 Rc+OyzMkWAhSZLC8e/GHh81OU/Bue7ZEp2yRYeajY1XUdnUOvndkSXT+A43vzBeeB4tA7kGYFJV
 MDTnWzZbi5gNxkbi7jlLDs24FCQXXxTOP7LlrhrYFf1d+7dsXiZaAexWTaoQzuk17AlvuUFAima
 vNRCj+3AwQJXqa4agndqxfN5bgLFlQncstAJtN/Q07yzd89OIoEYV1/UdxnSOaO9y5tSqLG8oc4
 8RdKr8vc/P+YqYOyfIrE6JBzoqE1mKL5Gp9nK5hiSFcTY1ak3nvxVJZslsu39Fru7kzcSL5SWoQ
 02uPigw3BtKyrnmfqxfLE4lzbEziCHuXo/+/CHr/wXlEFOVqsK/ereUg8OyR4WYj9Bu+ysmf4c8
 FNyeabvNR8zQWVDyrF6Ej8aZpjdd6vePo2dHDNISCCukYdSkpY3ZfdrN3wFeX6gukn0sOLLFtPl
 SMkp49bdMYAQrFtFcpg==
X-Proofpoint-ORIG-GUID: Hn_IIyN7Aj34XPc9SgGB1mXnHoE5Fx48
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX6SeHCrRvAuIB
 Y3iPlpdQ2BgMbQQfAEJ8tMB01ow3UTeG/No6SHoGnkQ5LQtDYYoUFrboV4zimNKg53qha+gOE3N
 X9SVRWcaeIzILOOhseHtAI+KArhrSMQ=
X-Proofpoint-GUID: Hn_IIyN7Aj34XPc9SgGB1mXnHoE5Fx48
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4be903 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=LVq_GggcSHk3DsAf1gkA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116992-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,34sk2zraoqtj:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FB0D7140E9

On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 90e50c245c0c..721526f023dd 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>  
>  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>  			dma-coherent;
> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;

Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
then drop the extra suspend/resume play?

>  		};
>  
>  		gfx_0_tbu: tbu@3dd9000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

