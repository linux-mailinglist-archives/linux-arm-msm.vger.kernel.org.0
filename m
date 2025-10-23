Return-Path: <linux-arm-msm+bounces-78608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CDC01B78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBC934E4161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE7430CD8A;
	Thu, 23 Oct 2025 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYt0E/IB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA63019AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228946; cv=none; b=YmEgYRCkziZkRepq9Mbo9J6h+mhAAgckDWvCym+nvlNio1DvOVt5fiD+9TdRpBBlGtesURTMU0EXLNHnIHyl9dXbG40ne6U6lLyOACQr4zFry6E18WM4tlGZ/+wL/Zu1JkVOMAiK0qcaJS8rRjR0NYMhRvejbtd8ERb5Jg1CWWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228946; c=relaxed/simple;
	bh=E8DHiUHBc+Kx0BkbHinW3qjbtm95S9kjEJyXbNNuC9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZmGqHiB6wjx6TDgwPE1l2X6+dA6jksy7wONEMuA0bnFjwpNF5iipRKwex/P5/8eAIvSMpRHbzcuGevDFUhWaqDCHulEqABFDkQ/2F6Yev+CS/JPO9f/zlqSF0Az45zaCwO5LAi1m00cUVTDs42kX7LldImp5I4+7PMN0noIC7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYt0E/IB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCKoTH022586
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3qgygDtk8UlAl4nQQF1ZdnPG
	AZqeQV2IEszwXskS6lQ=; b=WYt0E/IBt9ppMUHlSsxRFF3CxRwo7LvEHOvGHxg4
	mn8uS4aB4CpJ6L+1eeDeK413LF/ZIRiyjmVF+jXhXVNxEb9yOCijgfBlhSMi+/cW
	eT1JmaajhcDJzZSo6DVJ5O40zTPR7D3VlKVYZxQObsNvJcfvfqhau/E1kQgq0FP/
	ntZHLrHxY3tQ4Bx4blGWdsW1qxoSOy25rE1fSNK281affFKboVAy0Mt/auEH47sk
	qY/wiLG1LuLSRLZL5VkfJIFai9jAHMf4iwIrBBFFC6Xyfw8/aPXKmy9SJfIQqptU
	AUjQbcNd9DxIqexSpVX/DeKT7flEJ/9Wlsl8WbBIi4q1nA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j0aea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:15:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-556a4b34c25so1972579e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228943; x=1761833743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qgygDtk8UlAl4nQQF1ZdnPGAZqeQV2IEszwXskS6lQ=;
        b=CqYvthnfYaOXQqyUkbdK1jgaIlvYXm8DT49Q1MTeYtQiSUkvsfre1yOt9gqAPrkAW9
         o0zaiTQkuBBDdI/2P7TE6orQSS2wjhPwqGlhXGax698Ig7ZAGK9ngM/EJMWcApFBU1+c
         p9pj+bBMQuksyz1J/1bVWXKNPidYeYDYD6Vng7V8Ps6CWbcaina0rIMuqeil2m2gu063
         9vgIzhTdthDNLOLfcDBk4b0FMfFjHlchiTS44NugXB3MuSp2r6AXbSzU7JbGWqJ8u2v2
         TwkCFX73YKJxhFCq6a7BJTXefVQnfHI4WKOjdgl+JqHWFS8NlVKo92oSG0U06Pfv33pF
         CdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpe48Lb6I8BEUMFK6lAXIW8gI6QvDU+qbfsvX4OVCPaIyk9XnkRjI71TejMWHRI0WgGHz0UxhnpcbSH1E+@vger.kernel.org
X-Gm-Message-State: AOJu0YzUA7PpePi5H0JtwC5zTShoBn3z0n/pPbUrQ0elqExkdZWwzVQC
	r7QKaoXsQ6VQv+TCBnbXYqNQHNoD3YUt8pgkyozXUnSuCUS7BWCgdP0/RXoEEgz0GMQgZS1hqkW
	lg0Z8yqI8YyM4ZoJ12LknU/xIyMil7LGO0miT3E9v4V0UM6cz4CKDBVLvWXO1cqTQVYsF
X-Gm-Gg: ASbGncssW2SaRpv/V7C5oxfg6T7CgdzM8xgs23yn5D0U86ZGP4KyvhrQLAOZPlLws9m
	bqDR1lVqK5CN6ae6Lf7d2H1xt+UsFtfvxgi11TEmnUH6CCH1/X2JVQ3HEE1XSw2jlHxK8SbN//Q
	LV3BIWMcF7jcfc6cxoffrpnHemb88/YdXgvk6xccV17IGd5lGQ+QfrozokD+gcA1h8n2O7HrHHY
	Z8Ohangiemtn+1DMHdbnL68ij/uhg6U8WodCtEZoQTMuEl+/lopD0dNafkrdn6T9nNVzzYpN/oT
	u1dkKgo9g8zSpcnuKtFvZHJs5Ew9jDlWN8JdsEPDdGRWTCw896nVMZ6lDtq9zR2GspWJpmeIJ8v
	7WucqYAL7KMa/lI0uo3nw4SKqJ/Ei+6TXxihrVuZJJ1a0ucJVJ9LKl4PhDVz5BtiSD9nLmQ+I3M
	LCUF/G5Dsrv8ZJ
X-Received: by 2002:a05:6122:3183:b0:54b:bc2a:f58d with SMTP id 71dfb90a1353d-5564ee320c0mr8061756e0c.3.1761228631816;
        Thu, 23 Oct 2025 07:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9z2egEYQC6wwFdktlSuOrxdZPE4UHlcQ1aU42vJECIx4nLyzy1YbsX5qcp845m7FqT76pbg==
X-Received: by 2002:a05:6122:3183:b0:54b:bc2a:f58d with SMTP id 71dfb90a1353d-5564ee320c0mr8061712e0c.3.1761228631186;
        Thu, 23 Oct 2025 07:10:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4aded7esm778459e87.6.2025.10.23.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:10:28 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:10:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: add Kaanapali interconnect
 provider driver
Message-ID: <2dbbwcrfqvnd5efrmqku4x3rtsjalk2mjezdufef3hdnjclqpj@bcauquyryh7v>
References: <20251023-knp-interconnect-v1-0-df13182aceac@oss.qualcomm.com>
 <20251023-knp-interconnect-v1-2-df13182aceac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-knp-interconnect-v1-2-df13182aceac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fa3890 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=9fVyOH5KxkoKYaOAqNYA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfX31bsTBiLeMNw
 RXSSVPNVczjh9v5CCSHj0j8qjl3p3SM963YeGUknY9HoVCW9zO7zbi+kzCYAP0Njn+iAj/8keSs
 Korn2wNNa1EDsa+11jwLOPsIxmvST94Xs6buLyaHB83/rnpj5olNip3YvYloe0lBnzWorSEU1lS
 1i+JxGREQ7oYfNyPQJnrX22wiuza7fnWib/F5tm6Jb1pgy5b38tlEOlQ9FhWsS407ROPtuBEd3A
 AzMRY9QawpNEwJjWc89gXY8A/toTsVXr/EFgrSDatFOhUGB0jkPSyL1DfqXcSg/mWX5Q4UW2DvX
 wR6uT8pwuSPuz634ANz4vrHyAagA+GKSIcaTjk0lKQB696xRFs8CUT8kWHgB7KS6CDDg6ZSPQad
 a/2R+HyFjlbn6FvhqhLNBEZ7/mvHaA==
X-Proofpoint-GUID: 5ZcvlVTq9pbV-IAg_DJ2hGSr-lh3sN8B
X-Proofpoint-ORIG-GUID: 5ZcvlVTq9pbV-IAg_DJ2hGSr-lh3sN8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112

On Thu, Oct 23, 2025 at 04:39:33AM +0000, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Kaanapali
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig     |    9 +
>  drivers/interconnect/qcom/Makefile    |    2 +
>  drivers/interconnect/qcom/kaanapali.c | 1868 +++++++++++++++++++++++++++++++++
>  3 files changed, 1879 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

