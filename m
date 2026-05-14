Return-Path: <linux-arm-msm+bounces-107588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAQ6BBnCBWrXawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:37:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718E541BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BD8F301C01F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0673DD520;
	Thu, 14 May 2026 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YO3C7bqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1EcsDLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47E3C9457
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762231; cv=none; b=mZQcswjouyooyhQfhf/9pe4dzH64H1e63dkm6asxhr/hHzY3uCsMbrlotBG7oVM8dXkd7SHixOaobn9YdxdmO8UxLywUPlXadh5tD+zkfGPbXoKF2WnC8i5UfGJEaI2yPUNQ1XGgIcV0nWYkfy3ik3cl3fOmLIoJINRvXTE4oTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762231; c=relaxed/simple;
	bh=mWZA0swnjoA8588DZQ2qd6kAUz7BB2U37Lx+KCeAKQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeKU37RgSYkgrl2l0PHlE5VbGcUXcrKwbkqCdzyjrb0ZuLhBVVqEvO3+CMWWvPrJl3Jz3QOcrvwUDdHZYbg5Xo9WLAoA4YxS9FqAnYctxOhzp8UDydD2i3/XY0+oWfSWnHIyYQZg96MkLyEE/2RJV8hLEPcBK9dqiphds3QsMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YO3C7bqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1EcsDLk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWdw889453
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=; b=YO3C7bqTNygIL/rR
	zg77oN8KLtLkXw1o9VI6MvzrB6UO7CpuTxul8EfDF3ylpXFy4PlS9YB65ZpR8uuQ
	kQSzpsFi97NIDDLMkMZ0t0ll/vbQifE8iZE849QYOjqmINbfVtcP+6Lv0uNZEeE5
	plu6CnxD6EGbJNiBU2nfloYUR9laruvX1+mNd0NV2a1tVvb7nSKCyDT9f+4dexqN
	yzbF6ss/mLueX8iJvzhDKN5ao0aRWsgf3waW3bf42B35O14bClIGEm/7/i+UOnB4
	/jpuJ424cuxQRSmIbOQ85vsSTPYulquAkAvnGdj+oaJDobPcarkiAmgVQVK+sGRL
	2NKmaQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjktw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:37:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575b9b7cc20so361297e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762228; x=1779367028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=;
        b=i1EcsDLknTysL4TwcGcrkc3+bksXfOsDni88li5d9pdPmIh0+/SY54igGvo4VAwpzp
         kKfh0OXSgsHXIvLLc7/TjdqJkqcLN+nTwIgwkHNT+1y01jOyOza11plp59y3i39FCqsO
         /oN9OZomAE6NwVJWyErb7rKCy9dqNMVAjTpEtkh35sZK893G38EbUV0h/l3doW/0fBOL
         vyzw6v/vftHdpjJwUcTjIXoVC4ye0+hL6j+arXll2os7i1G7uoY/x/qF+WhegNdXg8IF
         LVZITeF94l+cti3gvjc9OQuJSVXTfojvkZLamfDli5ByGU/c1IdUMR3AJRfuhXZVBD74
         9PJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762228; x=1779367028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=;
        b=SWh6V/JVqBuZYZzXGv1DePFY7zblGBUq/EANXMnmg30aim6Ns05cI2r/DRjVij7hv7
         TnRKn5rFCXZywZukb8W9bKYIibR3sLAEAuJeXGRm/O4skScRvbpb45xUvBqaoTbmXWAB
         AMMpd10YKGB22zfRnEOpjUvRA36bH06NhPWd0MwTq8i8lzYVsIcnomz/bVuaJ88oQy2G
         9lax+exmzHy8XBYJXUIC6sUy7Y7eKy+RBPW616ndNXKpVnlERT7MAkKkWA1xE3IaMg5G
         lLBCODazdkcs2Bd0mtDoO6VIIbXDj2gMIIy6k3M6r9Ri3O6uKhy+arI3HtQoobRWUY0Y
         oCPw==
X-Forwarded-Encrypted: i=1; AFNElJ8N8Gz3a/ZmAMa1kWlbN1sy+G/D4R/QbEw8h8gyPg4w6Bt2Zm30jS9q+fB0hbGQwdfHW9QpPj2+zB9ghNGg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6sJvADP5TvrA5Ifvrujl2kDWZVOT0XBgwqzEcT23Wfir9PDmO
	Qz5PtUG+O8H9uCcnsL/uZmJT5cu0EJ19dx+zrNNuYxQwTQ2Ey7Jln3hMY1fSE983w2Go3M7E07B
	bDwNBmJD/7gl1P/jjfcBNeW2wbD0TsDp1PeiBTgVMJeu6iCS3fhtmQiyE2c+UOITQLn21
X-Gm-Gg: Acq92OHg1Abk8EZd0O8GRgXRO1eHg60E90wFP8Lhrwn1Jwtv67HqKcJ3Uh07NRQRLyg
	ylBDboWSmUiSdtG5u6NPnEeUAejYi0bNFNoV3my3euzRptKoBhA6Vt+VmIDgMb829VmuvNL7Uhz
	3pVft2do0z14ypDnblpBxvVAQtCNJtLNSleVc0PlTKnV07I9pjiGpMOrYSnNLhmKUf+YV6LlcvY
	iJkMV8ns3djQJo+laY67cbwyg1NysmXSYl0YGcuKy2UOyAciUk9fCE67j4sjrCM/VrqX8sLBW2R
	eW2wWhQGcp8kNP2QzfxSvAV+KVookoKHW8HfaEgFArCffN+SNmoN/awrMjPCO2xM8AoG35pn8sS
	Gus7TWxilkXO/tN4e6EE1eRjy+sHpixhpWYWUshUfzTGKa0XefgWb/zpVFgMmN+SrtS7i+0psfT
	6FPNI=
X-Received: by 2002:a05:6102:2157:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-637733f0556mr1164956137.3.1778762228442;
        Thu, 14 May 2026 05:37:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2157:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-637733f0556mr1164943137.3.1778762228059;
        Thu, 14 May 2026 05:37:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm84302766b.1.2026.05.14.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:37:07 -0700 (PDT)
Message-ID: <2a19abc9-4e73-4e8c-8cff-c2b28100abb5@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
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
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XVu0f5PjqWsgSdix32X5KBp4I6sIaECP
X-Proofpoint-ORIG-GUID: XVu0f5PjqWsgSdix32X5KBp4I6sIaECP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX1eT+a8e3JBeP
 r6XonBpHkeWIkUjyZYRWEYHSOAoZ+wjLyRPL5JX4S6ew6dFfQMwUX2HiQ2UcrNxe0Q9m0byuxF5
 oG7uCDMTm+SHVPrpF9zMNsQXoljIeoEmEkxtnBozuXA5OAS4xKlnAr8w97ClutrHnYsQA3PBEZV
 l1cT82xII6KBRb/uqzqtaBeVLTty20gq3YRH8zYEV7+Gct1iSKVU4LTQz+09KwBuvIuwANJ9vOo
 iCfaNn6kJSv7K0+JPV1bYhVPYTD+KrKxvSj2630r6g1SK5Oazcu3CAzWkES9gvervf1rL5v50GV
 kTzjdkrDnXD7SdQo2medcMU8/Wl7NEooGh0KMaXyxK9phYGnbX8Dx8HscLsej78qTIe6tyE95aE
 2Wteo3t+FA7y9BVCVKjvk+D4tftIA+HIEIFWnivG5pWWGRXSDSocW0hZ+SzPkg8tuQVEzlfs73y
 s6MvZX0t59O2//Axpdg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05c1f5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OwxjEWw48HTU6ZCEJDcA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140126
X-Rspamd-Queue-Id: 0718E541BEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107588-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali QRD device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

