Return-Path: <linux-arm-msm+bounces-102386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D8wLisH12mdKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:55:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1F3C5615
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38567303798D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 01:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2B03624C2;
	Thu,  9 Apr 2026 01:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOcuYsIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efn+Mmik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF00175A71
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 01:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699647; cv=none; b=jPt9pMnqDgi95YCsn8VUBUkFX8upWHek2IW4J53jUnsgpOTYFs6NhFimtL8laRqEN9uiQxvFxN3MOVWnfvCy47Y9FI53Z5Vlc/eJQiROTc64QMl2pYJIFOmup0wf0e+QyANz4kw3hFvQSFvp1G6mI5TIuDwatT0RsUHX7AmJZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699647; c=relaxed/simple;
	bh=eA47FzT1EGG/lamfButgMitcRPr6SgDq7yGDxrc26Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+h67Nd+YRAeUICoDmA/C/ZGL/7uv6uV2h4nZf+vwWzii3aUqBmxUJxQBHxOycmAu6H/9OxTKptykBDq5RqGxo5+8p4/7plZJOW3wjSwTisNrR9a044vNAr7F3UZseue9zCtnpxg75HYEf3PyrSkNSv735Nxz3ZF8VN0r34pI6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOcuYsIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efn+Mmik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638KwNf64107667
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v8G2+YPB/SBAigWP8cicpUlh
	on92WQOzogVuKzi0AyM=; b=bOcuYsILWql9JvTFzzh7Kmwx5RThK3+xWut1qOJL
	R+dHoWPH6V235KB06DBdqB4oPrE0PE+2Q4BkebgiHJgqcAs1KYLs6mhQKbRaiqXw
	JYA/SGC5vskBa3dYsEtsbznRMmpVDbl3/lrkP18xkuWDTI7ywTQTOyCVO/IfZFUW
	2fHEUxAE4Wk3g9u9N5tFr02vb/1g+uUwu/4QRAUHW9GOeE52ELLt7B2I85WD9/Je
	1ZFbdmFelDBPJFMbG0lyLuDnPRConGJi4AFyuZUvTG4H7M6v/ah7lTUc1hsVOwrt
	mOCIgyPejCF/0A7shXVnslrW9UladvYnv6IJcmhfyxeibQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhagqwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:54:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so22452311cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699644; x=1776304444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8G2+YPB/SBAigWP8cicpUlhon92WQOzogVuKzi0AyM=;
        b=efn+MmikHzl5l0pashwXBbolNKnKI+hDui8WqhZ534kyrOjX659XETk1scF5GBv1e0
         JFS430cyJqIkSfFrW7WqA2FsRj15NMt09gv30Lod4DHpC767pMmjcpM3tWJs5utl97Mj
         DrzoX8V+x4rUfEBgb6JgDWRxYxp8kS8ewD35mVQ+8am2Rg8C7yEXo67xvc2Idzh2isn+
         v7kG+8r1VcHBfdbPvhFQpv9sZlX0jCXBmxt8FYBXhbqndGkyOKyg3jtzpopfiy97lgir
         mDLDkCqb6BWZSUY4+kBXeGj20aVwenSN7/KyKrjfmX91yj+4fTjf4fvchRo4mHlfNRBu
         H6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699644; x=1776304444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8G2+YPB/SBAigWP8cicpUlhon92WQOzogVuKzi0AyM=;
        b=alXgo5EuICsenjfJ50smnXvZkSASySJdxttjGfRzTWAFPHf589VcifnXSd4X9tTApd
         RQTLg06atzZJrnr9B5/BcwH9Ui7ssBYUJTEUyP7m6ZVZ5I+lrrMt2+m3KCY4ovB73IGU
         qcymx9S3tLITz1AuPEX4xbk/KXb5acopcuo5YzqnKS17BuJ5Dn9Efc6VbDXglauP7/01
         AnKG6E2qfE4sxs630DepCbIaLAobzhwnka/Tp0LThH0HVWrkrs6cY2jZfFLkQ6K6DBmI
         DaT+IGkJ5T9e5jO1Cc4SJ/LM7I658MBjuox1j1J0hQn8JdpYMpnLs6tnB3TptAsDilb1
         +TkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmXtnE5KW1YoBYGO+uepmJ+OiTf6oFqI6SIihQkZtgSrS2p2wJtAxbUcIMvzhO06Sa8dCgpvKOdxHZFbvw@vger.kernel.org
X-Gm-Message-State: AOJu0YyRLqDbYhjmlmAvwKLuV0OJap4fcnksxqXzxxYDECshuDBuRKQy
	eXzPzwsImo5fiMZzgrQznbq+enBN85d745V/5JkPTzEsklO1tGlxjH4OYxPnUw9HurkRlMH/Uaa
	er/HXi6VFQ4bkvlCKGqZFrtefiVfIUYWKl0HAUMaLokjwFUYBjTi3frj+F1prbW8nvdyb
X-Gm-Gg: AeBDiesyt7XLljmd+EEtuFwUe/X91E9CdOD63JNpiQuVaQTv6dzBd6FVt8T6nkqVyCa
	Y2/gyFSsGA79SKdYj9fPa8TaefBJ/KUoxZuaVviFnnUskK88LnvawqJZ50/N898qwM/9vHMBPo8
	nmlbdn84hHxX8gBKA1ylnO2ywoRD+rSukt37anb6w7irAIryUkH7ofUEmSgMgmbrRtCM+fIRkYA
	7O7+vAEYi0ZaS7C4fU3k5H53IRrTrXT4CrGVfVQAbsbu+hYACRgadiGBgfP8gwbJuTU0NfgIgME
	DXVd1+BRihsiVgVM0I9nFpftURaJ+7jOn21iW71vnzSKP0qjIQh0/3M0nQvU0cE3kcpfzDwZ0Zk
	a96vfg8aHXZ4SF92QRH6oPJrZQO+01nUmD2qfS5yy/RaAZ8uQ2pvO6hmG/riT7sGnULC0oIDLhq
	in58OLKva1JPGplFtqZzZkezjl/vSwsDwvzu0=
X-Received: by 2002:a05:622a:148e:b0:50d:a8f5:d525 with SMTP id d75a77b69052e-50dc22b301dmr26151231cf.51.1775699643581;
        Wed, 08 Apr 2026 18:54:03 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:50d:a8f5:d525 with SMTP id d75a77b69052e-50dc22b301dmr26151061cf.51.1775699643152;
        Wed, 08 Apr 2026 18:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95294sm5198541e87.12.2026.04.08.18.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:54:00 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:53:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add SoC ID for IPQ9650 family
Message-ID: <5wwulhvswdyt7mwbzu2asmakb7e6orr574nlpxrnvpdehp7czg@xaoncvbzel7n>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
 <20260408-ipq9650_soc_ids-v1-2-e76faac33f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-ipq9650_soc_ids-v1-2-e76faac33f77@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C3lQdStnwRFAGQgatJ2ZeMwQxPm8YblK
X-Proofpoint-GUID: C3lQdStnwRFAGQgatJ2ZeMwQxPm8YblK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNSBTYWx0ZWRfX0KttcIXnozMN
 ZIcqMxbW1/C1PMi5NayXJOIEqvHMa60rHYaq5Sm3KwxQR5ewJWmau13B+xKJvlBY9M+7VH3sVW6
 d0fd0Om7RXY2YLpnMAvHsi09kDiBNUa/7tZADwB4fS1DOa1k7jOtYOWRIQ2FRN3kkHpYF03isqG
 vX+bEkF3OqKbixVkY4z+Tcf0pFOvAiMN8yAURFYPJTxo2RRIa9eEL80wcLgYeoflQZkPykbreyo
 TFN67nmRWsfYNwmRQSlcBvXHoKlpJvZcMXD34xcL/Z8znCxlhuJUaNcTX1kzBNZIsyWOvz2la7H
 MHe9WqK90T2wl14LSLRQESMaFfppEMBKC+i1I4wJ69YUsPT/lkY9gTMQTEksB9SUVKgWjIta+1U
 ibDp+mXRK3xX+K0Elf7dBxKC27JbyE53bDw6O+4MHxG+QpAoYTqKkhoW1iYKgCcgYLaTPae6O/s
 b30inRnb23gRb2XLZtg==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d706bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=V6X-YPDo6O0cH8H3Wq0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090015
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102386-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CE1F3C5615
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 03:28:35PM +0530, Kathiravan Thirumoorthy wrote:
> Add SoC IDs for Qualcomm's IPQ9650 family.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

