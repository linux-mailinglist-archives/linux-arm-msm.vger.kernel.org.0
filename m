Return-Path: <linux-arm-msm+bounces-59252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56135AC2975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8444D1716E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0816299A97;
	Fri, 23 May 2025 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaxsL6kt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D529827B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024288; cv=none; b=HXe7Vgiumdb3TgdQ8ySkUOs9i1RviBRtvfMeEC7kkMlIMlm+3Ylb3Pm4ArdhliNAHgazviNY4qhikV3MUi9HUXHiCSSh2BDqy7BjesKFru1fsPCHjkvCJsRvWEh5WUaqKeqwpC+pLOkomnyRmdnloHqEAuY39E748U60rpikXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024288; c=relaxed/simple;
	bh=QDWzARgH6DI1WqTflEHp5w74dOKGn0f4Qtwd5OTOxsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTZ4rnb7kypyQsbIvix1VN3SsUqKGA/7z143H79pVMS7ECbiWiRDgNqoALjV777yk4c1v3cWwetty6G7vVTfmcyoZSOoenJkvFqJKz8hx1ggRs2+dsZX3MObE23iqcapVdCOVphRmZ/CWDdgRcR/6dpoo0gmudh/hHn5DwDyzeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaxsL6kt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NC4fKK000731
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AQZd3v4cUfKzFOpAc2pmQho6
	OoDTUzX1hwB/aR2l5u4=; b=DaxsL6kt70D2ncypJJHe/nyChAJav63Bpqjba8jM
	+Kn3vK0Y3DC4XXQwRYF8yz+t20qjzTPRLnRn1/gwFfnBaV9l6TUrKV5Wu00PwDPy
	r9dOMiMW4xJEz3ggLagMHpXMesxZYKwcX/ZV45/3M+SaNuYb/gRedzt2q8SHG32M
	tefMxheqtkQmfgj6hvnQ0EAB80GMzY3tLPUtcAjfCNnzHtm52Zs5N8wIYYeipeMS
	TrkyWJx6qR72TImZmZp6cBxC9+zmSRGnVVhfjaMbvYviCvMqocoMFbwuQGz/UosS
	0v7zZqyo82jZffknehBxFkY6Lb9oJIvsqiAOiPq5sXXkmw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts6dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:18:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so3978936d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024285; x=1748629085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQZd3v4cUfKzFOpAc2pmQho6OoDTUzX1hwB/aR2l5u4=;
        b=mBDypXhyim34/tAHsfsRFpcgG+oI2CyjL2vcG5L20lZdq6NpQCrR58+xVI6JDtv0L7
         WBqtGbKkx0RVmIFoKELXFMghvgnx8S+nF87U0CdCSiD3yBtq/vm/2iFTuNZwoNjj9C6z
         kuIZfgzYs2eZpRD+QXpYhWd/Jh92m0X5pK9mZHRisw/+vaNdyGu9sgRaYZGdoYZ/139Z
         ubi8Wqp1+AuRrGNSFzjlIpeG1Rouf7Px8vVVFNAzF9FWJLa3XLyJMarTCXBBhFX1nvia
         ay1iGxyoykRWpeL1hvUF9gFjB+KmPE4cMPhDDdKkqZtkli9wToZUfqIqEOs3faNmzKWR
         zsBg==
X-Forwarded-Encrypted: i=1; AJvYcCUkzWXcAL8cRUjsxEkKMY/c/oSRnFaG4hgFR7Gb9+kq4GjBvDxOC2nOz8bTnlYcw+fzJKQ/xBGoXJrBfgRr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtxa6bAVCbU6AlYeBZvAchZMHgqyJn39gRYlDLyHrf3xIGUH4E
	RXPkf48XtDRYBKP3NP9twGpqcBHdn8bSkv3yVs/q+RFR44Xvh9ZMbaG3DwQNjsArJUQq/mQ67Og
	nKBdY9/daYGK3zvT3JjH7wI6oYk3VXu4Wlfzylc14llhpEWEyp72W9mXnczqjym/3mkzE
X-Gm-Gg: ASbGncvdNsKYsP0GNcXE+oA92gymnX+uz7FoOeFptHUnXhGm77K6aLEW+MFDov4gdwY
	NDcdQ0yVVjvWDS6o6T43Y/2J+jonKO5arlFFH/NjS6Evj1rQ/AK9RXUXYAMND5msLB4RDMubP/Z
	WGJ+WaGTMn4FqU1nuT0YVzGQycYQIRreLdnVLdXDSJMCXa4IGqyCkOv3zsfKyUVcgz40KDRqIES
	w7o6wnXVKw5DnEonlyUW8dW47XJUU3kl0vxs/dpfbiEyFS2wH9bulXTBWcb+baMWw791HCsUenl
	xsk1+M/OeixHvU1eHld1ci1MsuK5xesT/Gm7vljtoR+tG1zW5sOIAHSp+Fi9LWw6BOIEepCTzBc
	=
X-Received: by 2002:a05:6214:da9:b0:6f8:d40c:e3a5 with SMTP id 6a1803df08f44-6fa935f6c77mr68911426d6.22.1748024285004;
        Fri, 23 May 2025 11:18:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWZkiU6lLlMr1LrdN5ST6waLhFFmNiyS0xV9thJicOnto+p9teepT8E2kgB5uR0Pk4uiQ9sA==
X-Received: by 2002:a05:6214:da9:b0:6f8:d40c:e3a5 with SMTP id 6a1803df08f44-6fa935f6c77mr68910926d6.22.1748024284604;
        Fri, 23 May 2025 11:18:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm36921311fa.94.2025.05.23.11.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:18:03 -0700 (PDT)
Date: Fri, 23 May 2025 21:18:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
Message-ID: <uxn7fef774c3c7wzyg726zsr4zc3we6bmhomlappied6rkvkfd@wmvqrcehbcgs>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
 <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
 <2bce3b88-8810-412e-8115-bceb73d6e8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bce3b88-8810-412e-8115-bceb73d6e8d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830bbdd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6IpEqP0hCIXZkiAodesA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: S1CKgMSRmhDJrhQpRBWBCG3y3yK86WV-
X-Proofpoint-GUID: S1CKgMSRmhDJrhQpRBWBCG3y3yK86WV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NiBTYWx0ZWRfX60I+9ldXswi/
 7vCtTnGWHyOkeK8rmcKAE8pK4Cf40QYVRtypNStuJav59LRJcJq3RdjgrFWtIWcv/3uTqHxTLfT
 gH6DBK8YxSdA0m1LwpTyVcLJKeHO26b5yp3R9YY8hKPhWpuKDvYL8vkgAMH79z7nE3koh4f51mb
 pXI0UJLxgF325aDrMd/9ks2MQwt1yMdb0lbIOhfdHH08yeSayusWReENXjjiKhLtfYMkHHito3m
 lQVg1v2GbNJW+sdTyj0Ws0y9gdE5DDCDptkM966IS2EoYqB/H5qOP9/5pzJxLvTUGKV3i4KZvK2
 HsSMvgEA20saWyJgIzSenBQG7sceSpNFLexTBF9hgpkZhzlCvNalxzp8N5Dz8FWVAeXCqoNib2Y
 zBjiEWFQj+L+wF0K9gdQ+Rl9TeeuWbuCIg9L1xoAb0yuIGCo6kp3fph37R95apXn/HTDe2BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=732 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230166

On Fri, May 23, 2025 at 08:12:38PM +0200, Konrad Dybcio wrote:
> On 5/23/25 12:40 PM, Dmitry Baryshkov wrote:
> > On Fri, May 23, 2025 at 01:18:17AM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> We need more than what is currently described, expand the region to its
> >> actual boundaries.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > Fixes: 948f6161c6ab ("arm64: dts: qcom: sdm845: Add IMEM and PIL info region")
> > 
> > BTW, are you sure about the address? msm-4.9 agrees with the current
> > one.
> 
> we talked offline, but for the record, it is intentional - parts of IMEM
> are not accessible to the OS and were previously not described

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

