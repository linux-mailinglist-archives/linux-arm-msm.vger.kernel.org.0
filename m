Return-Path: <linux-arm-msm+bounces-116727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C+3oKReYS2rEWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:57:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F5710277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:57:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SMME+Egv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XKSnJZH4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116727-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116727-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098E5342D76B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E992A3D9DD1;
	Mon,  6 Jul 2026 09:38:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594813EDACB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:38:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330686; cv=none; b=IUvB9vz+u+Yfa/et5hVJZ38xVsv7FGFSPSrUunzm4+QeNqm4yp/fzYNxr3/Tk1kxtb34AHmC6epYWxM9S7z8QmUiDwkxLGF1RDy8ygld2nt5Kq2+qkZrfKwq4UrcCYbMTnU6TAltkAueZ3RyHaxKVcWnrUeFggx/OH9scZZjyJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330686; c=relaxed/simple;
	bh=Pj+ozva9T0fcwNSEKOkK2xdvTm9ebLUEPwBdOCPGS18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkZs/DP2hjErlr5Lc6pHmryQqAGRTIGBkMyrIZRDRwMJ8FiFCGqCP8Fz6/d+6Kuil6EvIbRPMkoFDsDmtj2iWWW3XjqEysEuuO1aWaNYPVQ56ZG3Tq07LE0ffVt0pKmkMXscIx5LoItlzvAiBKnmI4+hjkUZcrQg/PRXHVBTi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMME+Egv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKSnJZH4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693x1I4108108
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=; b=SMME+EgvC39EFdP2
	bvUtHETUasD8CkHlv0Jqwax6ufpmJ3R8p0IP4CWInLPYJ34pAOcmIvOsqLmVwotX
	pDkGVN2Dm4+0DvNhYD3iKDhIqCUfjY1FGr9V0XS6f15/qd/UpX+oU2RQxski7/gi
	yaX+W1CVH8XapWfVCbo4KQvNCmRy+eSpzktuQkCP9fBXs5D/WjsZMuVuQtxZ4ZGl
	6nwhnUVzC8LJuuXXgonFiJ4BhpYIdyhUX3IQHsgZR0HZDbEXp3MUnKo0b4Ozoe3x
	lQygoy2uVQAZaMSxFhkXWYUzKqbY6+pgOuVT7GeVXH3QSen4oDiKvkZlJrcL2/Yn
	CP911w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrjxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:38:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so88666585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330681; x=1783935481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=;
        b=XKSnJZH42QyiRCOTFE9W19cA6tF2eXv5FZhHqmlri6R/UAsYgv9dpWWXywftCyjDFl
         WfxSejgLnilZPn/2oXzH50htayByhdx03yEhSkSEY5MPxMnxyLevjZd0AUwcer8avX/a
         DzrWP9cimCR86LSEpknsnRl0Ro625dOIIVfBlUMlSIPzZQIwENSTUlMXw27KN0fIVkzD
         zc1pLVuYLE4dXjF4q56ao5osPq7XfaAIS/NPbLp4Pe6lGOGOvyqACfEFyzMmPK2B4f6z
         BvTL9vjBjf1a20MRDM1b4K0R5fAGs1/LgEppT/REfAHuRi/QwE1Q5z9m2dPeYTWj+5N3
         /yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330681; x=1783935481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=;
        b=P1XiDnjzMP026ty73HfP2JqaccDim52PBc5SedriDdwweQJKHNECIaomcjWdreT5Hu
         12I73pENexw1zLxOEUTGsTieFx/pw/PAugFYWEZdwtfBorx+CQE9tywnMZ547+pFIjsr
         khcd/Xo01xNktyh97UJ8kCwEHI891fp4G3oCfdFKLDv7AI2ZfqzPTV11qf9yQoLbtFGx
         H6jK6qOxYlqWinP8OamlfJXYR5VEb4IZRC0qF0AAHOfT4impF3jKswS2dwC0xTfyBx/E
         DAgtH4Y3ZJ4AHSE3noSFJMMPCXNVGE+Om8Jy/10nJy/sl9zPh1iaF59BcFDJMLVkHefV
         Gxmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqdj4a2PSJsZEp4sInxN4nGjMCVu9fvTw18ndT8vEqpkYNTGIpFlIhz/H2X9i7v54vg6PvY0UdpTXLJf0uB@vger.kernel.org
X-Gm-Message-State: AOJu0YxEImykL3jfqWYI/CX3Pv/gbVIhJpRA0UPSnpW5eZg09/HhQsdi
	NEA1A86+1HBHy0G4AYaCbW0F3k5aGSlQPS9b26NcnVWozvkB9Gqa4glSmCf5bWdvTz9FXpTTSK0
	93aUKcI77/IS71X8Qgy3MjWSmOtkUGrHhx3wYPFtfJRhqr8WYzKOucPU+aWzHFVmrLewG
X-Gm-Gg: AfdE7clJskvHjTVTLWoF+0OStBoI/dKvVzGyqmO9cbYi4cbL3L01R/ZodIehhTkHIJa
	MNx1Vdt8VauXzaoykAfx3KLdSnpGClL2cmF6Lw4AyJLBPdTibBCKPgUws46Z9paUEIPNcw6xyfs
	I29ErC27GHBLIhKEXXL17HFL5c1drLslsmyZldUNXgMGFIjRa97V2Kb0ywBb4pUDx1oAwfBirF3
	k9tjCjzmXnIozHYe+dDNIuVvaEjoyCnFLQLjwFoaEpCF1Mi7mr2vQcJfHioBoxsHbexthG0Y0Pw
	jiLwB2JBtiqsjRqVgjHSUWbG+bymTlKLdtIL2tUKx/Iphve/jh69cPkBjD59dsSWChJmHZcXUyX
	lpgi3xddFr07vAG1MhkeUqNyKwwIbU+u3YMc=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86773201cf.6.1783330680869;
        Mon, 06 Jul 2026 02:38:00 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86772871cf.6.1783330680497;
        Mon, 06 Jul 2026 02:38:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm709337566b.9.2026.07.06.02.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:37:59 -0700 (PDT)
Message-ID: <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:37:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sHnZo7aoHTQGJzrbb9RirgR1Mxy36eRs
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b7779 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z65YV3W3F_EkYOo9s_QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX557yPCX5j+Zp
 g0DDOX5FjSc1J+6i4dMUH+2ExJnP18fNAEwFU5kFNouVaYYBD8h2kEQsPJLhzYqCJ1rLQEC7Xit
 W1em99gHNY+9KeCP/0oe6d8RKIRR2Dk=
X-Proofpoint-GUID: sHnZo7aoHTQGJzrbb9RirgR1Mxy36eRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXxc3GH8Ve27Kt
 Cxe/2uyOt7jjmohlaGs3X/LPNm23KsCifKgEXQih8JoRja+gmsnvXi6v0POP+oWp2kXKsMIRdSs
 M7JSXlXULWAqy5PLPe+3N8fUcetUIzLAaiqRtXz7k06emtZEiZEVJovr1efn4yveKusi08mzuEs
 THeFdsElkLiP4++qf5wFWxGM3zXtKfqDSbu2g7rZubF4DSLmp7L3tZ4JpcvTpw1ymZyxd1cuGk9
 F6L8BzY4ocaGBYWeDqa8V99L8am4KQbB4HQ96mD+fYbW77MZAhXAkb0gY4GiRigsT63FyPKZXAL
 oa4znpn7vlfk2RuohW60pAq3u7u/nq4vOikNxcDOpfNXApwUgd/C3L41DEUAbIKYIrQcNvx6VE+
 Ah7YuTifwEAqBe2XhQvTGDZOgZXXpAozkN49X/PKfKxKQ/fWjMMM6Bg3tDaJySIjuZA9QublBp8
 B7JVNr9hDV5ZbRY+j4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 526F5710277

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			qcom,gmu = <&gmu>;
> +			#cooling-cells = <2>;
> +
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";

This looks good to me, but I thought that on a8x, we're supposed to use
the freq limiting register in CX_MISC - is either of them preferred?
Or are they just hardwired to the same thing by chance

Konrad

