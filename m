Return-Path: <linux-arm-msm+bounces-107572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIMDJLmoBWrtZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:49:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 381BD540954
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4E73065351
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB043A5E7C;
	Thu, 14 May 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzVwWxAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKQ90U+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6697E3A7826
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755583; cv=none; b=r4jSvYPFfspgbH/9Odo1BLBFbO3sjB0p/Ry/nUtNStVv2s5osuGHk8x2DGOBXL+XnFmmEExqpXUds+iAhQswD89CXVHr3NdIdvqbb3oBMQsrmvxYn1uB8PS72VIedxJvZCzeZzsGrr4TlfpP2JNiXUpTB5cup9PiSoW1RRek7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755583; c=relaxed/simple;
	bh=u2yRYeTk+yXTAl1pm+t6z3kf8/ELAek6AheCZmfXdxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFRxLGnKLWDaxa55k/2OdUMNhqL1ayNSg6DWrykWcknqMr6Kf9cbcxWlsn3fLab2sw9B6EuUkCdM3X0rF/7EiVH+HZnepZi5dJKh9hISzw1YqsdL9KRUm7mr9HDhUBkg4REJrt4/ZRcSfWeATezo7WB7EnEWuyLhUKMM80XoxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzVwWxAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKQ90U+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kKML3641047
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pv/Imfs1xInWX2bI1umtnP6W
	sGJ3pVBx28hlPbpJCp0=; b=mzVwWxAi4P3ygkGjm5V87OhXiOQF9dXWLQm/UzSG
	wvJhZk52MFp81w99OnxnWTY7BZkcXRB+PPOgPYDU8XP7HdqkmIwXi1u5i+Ds74ny
	ATTvaBkxCroCf+7H3e5iIA2cs9VN0mbMeSdYt4ziEEyl1rbcAPXtdtO1e1PLq1pL
	SU16meGVW6VYsvrqLGaJlxpFhKYcnyKRmTl50Yrsy/69sP9KNwj6ZOeEvva1r0cA
	V5dRuOwj9H90QFIWHCwyKoPd9YthQ7/Ft+pYLnnrWl9+Ri9h5UitnCdPR+SX0r6x
	vb3P7aXaK9Dhhxy21tUlCrnMv4UXKu21tLq3yM6rXRy77Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tun3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:46:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so85053891cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755580; x=1779360380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pv/Imfs1xInWX2bI1umtnP6WsGJ3pVBx28hlPbpJCp0=;
        b=hKQ90U+m+Uzr/t/v5TZEYpKBXJaVJH+ubQmFvx1m7hO7F4Yzb0LtQYt/depufUPT1o
         9mhWqIGoR0m4ml58jMVUxCj9ei6yveFAy4rR8v8SbUHRfiAvf50Wt9vc8ARRzLRc5xun
         QjitsdbEbMWnpOAq/gaVsyru6OhdKSPw7r+KJdf6xCA56hIUcV6j2anz+vDx+UD+j8y2
         zmEsre3PuB5xd3fpjXcX6JIdsbhbfDGMduB7ZCF+5yB6J0yrH9b2zTlrSBFMYpc3YaLJ
         FwRtbNLRIpAzGrJR4Am3Uagccbuvt/83j3uKQPVKnsmDLcc1N6h4U6OeLavlbqDEiPm6
         hY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755580; x=1779360380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pv/Imfs1xInWX2bI1umtnP6WsGJ3pVBx28hlPbpJCp0=;
        b=WsBCmPrURIaSo51CkHe62b4V5w1WlUu+U5YTlJGw0liIsRUMgzQUDODg6197b9Q5yj
         7H29HO76fI57+mSZ+VIBXDPPJk/Q+arcxx/XxwmqczUTQpQrIGFD4qQ5AxeucG195eS4
         QjjB9Q0KkIltgbPVzLJ4GjGhhgEmKg0AboVxfJqHjOdV7WVlwFKTrREREJt1KG+1BQ9R
         lrTniNfq3EOmBCr07mAcyEL3BxKa1s2FZu2utilbFCglbv7WJpLOsdsZWyi6FEu+slow
         /QQ4IuD00QxVd3h78P1HMq6ledCb+LAxJ3iZ8Xu2j4tNJaJHYzvZX8TP32brGbqNR/2+
         j62g==
X-Forwarded-Encrypted: i=1; AFNElJ8V1J8p4MYPkrATl/Bt5C+fr8Cw/dZv1P2E/ClEtpd/XcTLmHd3/Cjz/f0qU+Lprqwmyua7rVDfKpl8gdNO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SlJeLfaTF2HouaFFe7Br5Zbf5lNhBhSiLNmpBigd9T4Qz4SS
	Ak4KmZws3e9l5bebk1G/lJchExLTXpg0Gu75/u1TLETwUNnZBVY3y9GTvyexsdQg37RIwS9erbM
	Xk0988c+UDfbbcPg2/Ibcgq8yz0qm9aDYIMzzMVCC1z8DqzDgcoOB1ZS5besbjUwQM1LS
X-Gm-Gg: Acq92OHfM3W+DrZEfHWLx0nyzyMzIunoJ2in7sz9WuHQrWIP9gZAACd9rVmhI0jLo4b
	M22XquOEUUUWb8mJEO9BDvVezkVFH5HFp8TVt8Y8uXUk38MJLzQWNNvEMp+oS3tzLH9Hc0fT4b2
	Z4tcywX1Ko/h1YYrvw5XF3rHie+T+Tbsr4pDpvJ6YpVfoS4PJA7ED0vFFFUWUIZszenelVJA91g
	PkOBCyqK0ItmUwTsc57afoyGnVi4WQDZEIdI/VNWNqWeKTaaCCp32PU10agIt3GouqTFMr45qw3
	yqvsBVheQduvolfJ3IZBZZI3ZlcQhItoGG2M92ZUFcmUDdMNNC8fxcAkuRuP5zLfrWbhuFWIBaf
	B7TUS/k+XOh/hV0gfV7SvcYu4OQmqjc621crV
X-Received: by 2002:ac8:5888:0:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5162f49dcccmr98843881cf.15.1778755580476;
        Thu, 14 May 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:ac8:5888:0:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5162f49dcccmr98843411cf.15.1778755579925;
        Thu, 14 May 2026 03:46:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm6111166f8f.35.2026.05.14.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:46:19 -0700 (PDT)
Date: Thu, 14 May 2026 13:46:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add
 SDCC1 slave
Message-ID: <fnasmnyh7rf4wtyrv77lunx7spilgjxji3ejflvufouqrdep6n@uu7pkkfwkxyi>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
 <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05a7fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4NfwwHxzEUokdl6m7bkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNyBTYWx0ZWRfX1X/7CutiMd3l
 fq7gjs72Cu8Ee6K9Ql466urObHblBmpLKK3WPhyv2Wrb1AxBhyeFXf9AFHtITnjjssLN4/WbSP3
 1aYtOXhCfy4hGV7f2+hPOQKN2v2BBLxcMoPSNQiIfwFBKCy7ZSlqALZMoxSaXjDKTPpi+R4El3Q
 DFXxkbwBm9n0jFVmD2MwGGQYORH9LduXPM+l1yxToHyr+Y/MtnYRzH/qaoVpJu+9eWRV6PFiGYs
 DtSzPf7JQRMclSBhPmha1AqA6ZpWGYpsAtpUzUKU5GZo+9fvpTlpnmFnYm+a6vo57040Oujld6n
 FTUXi77yQlSRQd0dzQGHgQbGbvF7WCDDBLj/XRQRu3Lc+kLlD3g3IZ9wfaeOoXy8E2fdqkjyP/d
 422XBZPRmElbxwjiNt1fGh+Ryut3sOa55JZFZCXzisnybJnHDVwL/rqqZUJ+8CViNpe23vejAg5
 USjCdIjmaR/DFdHe2hg==
X-Proofpoint-ORIG-GUID: OJca3_QpLP3sA_v_pasmaO6OD-drkQo_
X-Proofpoint-GUID: OJca3_QpLP3sA_v_pasmaO6OD-drkQo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140107
X-Rspamd-Queue-Id: 381BD540954
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107572-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-14 07:44:12, Krzysztof Kozlowski wrote:
> On 12/05/2026 14:18, Abel Vesa wrote:
> > The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
> > slave ID. Add it so SDCC1 consumer can describe the corresponding
> > interconnect path.
> > 
> > Append the new ID to preserve the existing ABI values.
> > 
> > Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")
> 
> No bug here to be fixed. Incomplete first posting is not buggy just
> because it is incomplete. Otherwise please provide more details about
> the bug in commit msg - why initial posting could not even work
> (although it did work...).

The reason the fixes tag is added is because we want this to be
backported, as the id should've been there from the beginning.

Anyway, will drop from both patches then.

Thanks for reviewing.

