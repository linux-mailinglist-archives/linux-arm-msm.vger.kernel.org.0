Return-Path: <linux-arm-msm+bounces-51840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B112A67EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F356D3AFB7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1896D205E18;
	Tue, 18 Mar 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1cBdI36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA21DE4FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333976; cv=none; b=hzN674qhnzZJQ8wwRb6wkYqNSJyqZxq66pI73gpwADN4hATcJ+wkzN+Ak5uCuPIk44lv3SPWznIOeZX/52HpMueZY9N320U5C5hj11ER2Ii2is12kkp4arR35Kduxj08TpyU+0gUjY44fYqxpggef01VavwD39hdA6u1qUcKfaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333976; c=relaxed/simple;
	bh=oVDhCneLrzXiBz83QU9c/Kh6UQKeVOnCHUu0xq6bos4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjmlzZvIekswVZzXiXm3TasaDBkhbIQgNTS50GQ0WKYIf+2UHaKGVfnmbezh1o8vz0nRjtlAsnDqMj+HQ6vffeYzgud52KT9BOf17eejH6jq9wz0n8zMZ/WqjurBfxO63CH/xyv83LPT2fCWiTjblZzrgnxnH6Ztz93/oVFg2CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1cBdI36; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHs31f014864
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=io0+rG08jyQuVDox/j2ODyQ+
	2gpx3sWiw700hJF1YnA=; b=l1cBdI36n2yoaEyDfiVWhAVfSuY53+jpfitVoB+p
	ZRII7PJ6MbVEtpsQtHqfvXedvLmlPsdQhFBUtQCt2uxQVuDogi49WvY2vlmjTA50
	tPkN19qr7Q7gHw0p57ujIEbxrY8D9w0+bXEskhmCUQayJM9gMpUaGjid7mubEN7K
	zVWk6AdVqYcwMR6gjlwafbfH99TzGxGfDZHWanrwO/4408hpgM/Jn+PjuRiZRYKA
	hZpNl+XzuW1KDwUh7YjOAhID6kw0JqLmlml/bTMJxsqPskZb729gtPrckNrTv+nK
	XmJLXnAuA6asOtGxqdN7o0pl9a7xXeIL6l4hLKR54bvbsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwrfsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:39:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso102905376d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333973; x=1742938773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io0+rG08jyQuVDox/j2ODyQ+2gpx3sWiw700hJF1YnA=;
        b=RF3HWUvl1R7EnUBjMTMMyOHYtx2UUP6ePKJwWQExl+1mLO/To1LE+Vycd28lJxrSvb
         irmMdsnoNaP7/nWQE322WPG6/Q9LFZFS3WeqW9DPjGSqo/XK+DgBmXxN04OATtWpBQ4/
         xeIQuHQI3sGUlJoS4nJ5WRCPUrag9yGfgmuSpeLvNmcXTfh7ogFZpWcXncIlKvjzzV3u
         e3m7zyvqbaIY/01jjw/cwe+vlBdizxz8u7Qy63zfGxogGo8PB+D0adm8NuZrTOX9oSZ3
         YaLvfFe3F2BAiU2F1oJUTdEb61zCtLnjumf5WREJTXZVGAMuuuELgp3NLVognmGRa+T6
         C6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV/vMneWaA0t9vmQ+lXLS5PB6pX9ejLD/5acmd1tY1/514EJ7BwsJa/LdQyuUqxe2EfWuAbUOpZY56vaUa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ILYnRz5kJcIPSXeLM57nY/QAASr5RN/MSG24Fj9mArHWoVGu
	VKP+PlAOg1SqFzU4n9XdAWmDlhDMSFLWz0GsM6Yeof1ORf/5B2vljVfFmO/C3hPhUDCfTr4C42v
	fr2DKu6g+ivq3uDMzXCBshrAsCwyukV4A4IMsOzszFX8Rc5t/BsCO0pLXUzHFf42t
X-Gm-Gg: ASbGnctLKQDsB1uRBCMzV6CrzXPuSQ79KC5eK/dVRvYaGkYLM8cEO/SweIU3U4I/WO1
	e8f5fTXws2KKQxPQq9+E6kINmo0G8xe4uBizCq6FXwtAR8rahKUbuY0zbJQPCWLbO73Am9vK0f4
	xZK3EbTqPUR9fNw3AlWpqxqsPu90RASZx+wVtYStEHEu1yc3FrQc1NxW86tQmHDYOIyJcAUNSwq
	44UttlXWNIi4e7kuZJgCtHkENJv1yJ13JY/LdNK1YN+812wviRUUCe43GeRiQzI8+oTgi2snVEy
	obvdk8XyUfuq4ZNiyArio2/gC/BydFyXMs7eeN0pbGin+qzDUTcUvibFI/4xRQfLV6ArRuGVO7N
	1dDE=
X-Received: by 2002:a05:6214:c44:b0:6e8:ee44:ce9f with SMTP id 6a1803df08f44-6eb293b4a2dmr5529276d6.20.1742333972674;
        Tue, 18 Mar 2025 14:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0U2l2RyAju9tgrxofWi6cQ2Kcl1PuoMDDqu8P0QBMhO8hHnpC6loZwdkR82n6lsEl9RvuDw==
X-Received: by 2002:a05:6214:c44:b0:6e8:ee44:ce9f with SMTP id 6a1803df08f44-6eb293b4a2dmr5528986d6.20.1742333972263;
        Tue, 18 Mar 2025 14:39:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1e8bc2sm20796751fa.104.2025.03.18.14.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:39:30 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:39:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stone Zhang <quic_stonez@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_miaoqing@quicinc.com, quic_zhichen@quicinc.com,
        quic_yuzha@quicinc.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <4srz3ztdena2p2vlzymfmk6oz7q6ocww7y7mdxiyfgdrpu5may@nhlvmj2ofkcs>
References: <20250318093350.2682132-1-quic_stonez@quicinc.com>
 <20250318093350.2682132-3-quic_stonez@quicinc.com>
 <64ccc09d-7e1e-4c20-90e9-43b36a9cc46b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ccc09d-7e1e-4c20-90e9-43b36a9cc46b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XAuzpvQLYsEqcV4KOxN9nu-Mi402M3sO
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67d9e815 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NXR--wKKspllqp7VDo0A:9 a=CjuIK1q_8ugA:10
 a=dK5gKXOJidcA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XAuzpvQLYsEqcV4KOxN9nu-Mi402M3sO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=959 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180156

On Tue, Mar 18, 2025 at 04:54:25PM +0100, Konrad Dybcio wrote:
> On 3/18/25 10:33 AM, Stone Zhang wrote:
> > Enable WLAN on qcs8300-ride by adding a node for the PMU module
> > of the WCN6855 and assigning its LDO power outputs to the existing
> > WiFi module.
> > 
> > Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> > ---
> 
> This change looks good generally, but please align the various stylistic
> things, like property order in the nodes you add with x1e80100-crd.dtsi
> 
> I also see that board-2.bin doesn't contain the variant string you've
> suggested ([1] @ commit 646e008ec53a8bb9ae16ebf98a65b29eaefd6da4)

Yes. Please at least send it to the ath11k list as documented at [2]

> 
> Konrad
> 
> [1] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/blob/main/WCN6855/hw2.0/board-2.bin?ref_type=heads

[2] https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

-- 
With best wishes
Dmitry

