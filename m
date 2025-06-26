Return-Path: <linux-arm-msm+bounces-62580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC623AE95A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 08:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D388189AF33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 06:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4C12264AC;
	Thu, 26 Jun 2025 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctxmq2RL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B6221555
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918106; cv=none; b=QbdYLOFNA4yceu9O7OhkYKFo6SoP1j1mCNmgpRFfb9ZRXo9WJUXTYNKmxfs7W7e7UIdwK1qWFQiL6EwxVKyyA1vvLWt6RskHhqwkpN5xlIxq3aiBNxuZ33Sm32sxMtrotqjJEgGnBx38FJ4ZIBp3sQ9OklEmFa4YGxZ5SfXt3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918106; c=relaxed/simple;
	bh=hQt7Bb+9AHZnoLo9cKQWepwSiZXlnwjoIITYMD6kz1o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLI1H1eKrM8saa6Vn5ZesPOyyH9kX9mvHME+q07Zs3C7tf+hHryKLHxQycDd7k9pFmmsPrr84DQsMTe7rdi8Df+4yck3RY4oGhHQLo6vfQ/R/fkJ+Et5SvdeIoUpJ/JX05WRNMuOMMCQk6iTn0cyyvldbMxh9YjwJEdkdsJNZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctxmq2RL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Dlia021525
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgSSowuZf4akXznD5e5++XsT
	7x22KvtmyyRb459j924=; b=Ctxmq2RLgZ6RxWpMA06IHd8X0JAGu/tBkkA0dPUU
	qrPcAsIM3REiCkumKTxejL6N4onSYH+KAdiRNlz2iSR3twby8ocsisgEgmvp3rcj
	E9WXyKXVEKDKzRhU05K2Bye9A7KnPVpfKylg1YRvuiWf/aEEDxiq/gY8cv5athIB
	HdREA1Xn/pt9yE97iVbiwHJuXaMnkGcC5tfYrs4rh2ELEtwrAqs8YpuM6SOHro+p
	1KA2nLFCZwDpZYVllCJnbiodpQ8JkCCntG3kyRKdpbX1nJIj6nPASfz7K10zRFKi
	kYTaM8BsRE3Uz/c37BkOEFpJrOAQ8J8it/dd9h/G/Y93tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx0er3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:08:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d413a10b4cso100254185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 23:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918103; x=1751522903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgSSowuZf4akXznD5e5++XsT7x22KvtmyyRb459j924=;
        b=jk7uZii0dFdZ6rVLhakbEOPigKu7oxvoPsDHbaEUuryBLqp36/6VjRciWYLvL4kJUp
         fKlc/36nczLgq0xiEr6nJJbUFb9j9Cj+TKeLd6lLgKs/FXtgLI6ktP/j6yat4i2wZm4X
         TfyVc8liOBWjNWN84phyqy3t5sle2y3NyWp6EYf5hmmi+OACwFqU/s95aJCANwYpmSfu
         /ASpGhs+aSMNK+/JPQUU9EEuuSgh0Kt0T4Mj5ZV4vKSDeDUsXM3OmORZaVdABmI0UfOp
         xjEZAd/xeyxuv5lJ4KOS3A6+QYhX2PEpc3W3qXPVCg0MEMKufcTdqhj/gvU7EqQ/N2R4
         PH7w==
X-Forwarded-Encrypted: i=1; AJvYcCUT1pcf7VLlum7d59L4ByOBAVshnknK+xXaAo9UFq0Nky12GN6HKD/Z2N00sF3ZKmDIUVnq+EgZ3iHza1HR@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPLr9SZV5+UKqgKOaNM2OPwSP6nP0SC7wMbvec3i2oIj+0OTP
	u9cb8F6CV4jenF9lbQ3fK+2XPx49qa4ta1vfneyz6bBIp2XqwrzQy+mcAXyI2Wej/oELF6U98MM
	oNbqNIvpE9iszyngmO4gzj98WF5gtS5cilm9t1e+pyQ8MVQcjYU703CwQ8Nn9FHn0wII+
X-Gm-Gg: ASbGncuNL8Pzvq6YvewH5iDalX7cuuCxX/BFFUh5zubp2ONkqo2ngQpu/X/7thJqD8m
	oRKWMbo7j3/2dyG2cDoE+k+6aIJrlHOkN9fkxQL8PzVkzkJ+Fk9HYExj3uLHq63ftgfDX4N/ngK
	yQreftZNyKq/zIpetJY2t5ioGLtuKswyz6YkDeWcROEtAzbqbBXyP1zd0Y1Vact/JC1JdXZ4I3F
	MXDw2MyOQChg57hFZ23rFkOtvZPkFBi/yf2AiMsyNvriI707TjCooLPSxTnx4lM54aHWARf47KX
	WVug8zfaJlP7QC/aUF/XvvYyRKfOkiQKSf0meC8bG+LuJjjlv0hqeWNNiA==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr309276085a.16.1750918102926;
        Wed, 25 Jun 2025 23:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/nANbsNfBPYKM6JWc6VRoFZoFTj2niADtQPcOroE/JQv3VpyDDjmmolr+6Zi96Ucr4lEHUw==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr309273185a.16.1750918102498;
        Wed, 25 Jun 2025 23:08:22 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453822c6b9fsm39477585e9.0.2025.06.25.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 23:08:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 08:08:20 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aFzj1LxEbxa3rHhD@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
 <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
 <aFlHlxO/V3MMARVK@trex>
 <73aa4738-6730-44fd-bb26-451ef49d588f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73aa4738-6730-44fd-bb26-451ef49d588f@kernel.org>
X-Proofpoint-GUID: oah334OuLSJ5pEy1pespUsAGZJAvHgvp
X-Proofpoint-ORIG-GUID: oah334OuLSJ5pEy1pespUsAGZJAvHgvp
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ce3d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LfWDrbMk3Fy7126_j0sA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0OCBTYWx0ZWRfX8FaI4S8SDYlt
 WUPeB6WkhSk644C8LLWSHC468ud5b0uajdzPL/2MG9wo53jZwjOvDhbT2sAoIe36mvJA1znlm0K
 8FSh0d3DOJAq48SMaoQGikYhMVQSYwv1c5qv2w7QLo9yVSvVFxdKIoT1688a2BCBWm7IoJzFfxw
 B8SL7RZL8xSje27O9YDQWHP81iNksyotwTnoMdtitMRb9qaXhQmTNrZObSRtMzXVHKZDdj030RV
 3/t5EWEd9zQTW0sjA0L+96qZL6iXXB2G4TOhSzt1ZkeKh3DVgPxddjkztXoOr67YGNDu3OVxurk
 U4olYevQZi9qK/6EPbkQDGytv6f5FetvpS9/vyX530xwDa9ALrOVXS6iBxl3+sy3M6zFe2TOWay
 gD4bAVqFVtU9qY4cjsh97N0X/ORllsCP6nxxHQqcsya1Wn3AwSAHW4lIkvaUuF+dbtja+gUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=885 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260048

On 24/06/25 08:03:46, Krzysztof Kozlowski wrote:
> On 23/06/2025 14:24, Jorge Ramirez wrote:
> > On 23/06/25 13:49:21, Krzysztof Kozlowski wrote:
> >> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> >>> Add a schema for the venus video encoder/decoder on the qcm2290.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >> Don't send multiple versions per day and allow other to actually perform
> >> review of your patchset instead of sending for every little thing.
> > 
> > No. this is not what this was about - I already explained to you the
> > call I chose to make. You can disagree but you should not misrepresent
> > it. 
> 
> 
> No, you did not explain me anything. You sent v4 with only one little
> change:
> "Changes since v3:
> - Fixed schema commit subject."

um, I dont want to delve in this (only because the conversation takes
longer than actual changes but just to close the loop), I did acknowledge
that you had trouble receiving my patches - since they were threaded -
and that I would be respining on the same day in case others were having
the same issue.

> 
> The same day, also skipping review.

yep. will repost later today and thanks for the persistance (dont think
I dont value it!).

