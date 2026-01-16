Return-Path: <linux-arm-msm+bounces-89444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6FD336D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CBE8304C913
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73EE392C59;
	Fri, 16 Jan 2026 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMFBYS7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dl+zvoem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108E343D8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580150; cv=none; b=JKHmWboVGrcD8nuA6q2N9iU3jxhAkkm/0y0vK98juTK4ruWbBarpKXE19Uc5WsmQJnovm7UQXGF9A8J7Wl9x5NTMm/8TL4jBxfUkEa3Y99yR/225cqrmX56/O47gG6XJzUh2pN1jX4UFylJeLJ+tRCgKfUZ42Xn0yVFbhGwDRGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580150; c=relaxed/simple;
	bh=xlmF2TedRlLX4pOlUC3j9NDW4clhMYuKzO5fDLT7nz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3vKZK9U1oyuasBplpI798dQxTxcwdKygYlmP63RHP0DSDhOqEuVWx84dZQNhkJe7D4HAKBTgRrr6v5ZnLb1iydyTdsBPie0NVsa/9QoZF4NhYJOQmaKbgzeAY+Bmpm35N8iOVGfjgAIf4sLZAPLKZp+vGp7OR0nAwlfQ+mJcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMFBYS7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dl+zvoem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GG0RFn3714946
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZC3BgfWbRTghJiseDzpBiuOP
	0ljpxEF3ruRFm5DAwZw=; b=KMFBYS7Zm60h8n9YpoY9mm0TjKpVnxcgKgpXCqCT
	FsYxrl9QTvodKOS8RWWytXV6yfKNUnjf6V4KBfe9fiqPLJrd/FxfW32HtZzkBI3/
	TAXWPG0Kxw+bl76zNrfrFg7Wt8r80gOrZnD2F9uEShIbyRQ8BcJRwgIwnYbV7Xn+
	EzkGiLgV8cTTo4czGK4dvMJuzWOLioiT18VVpqrNU3UN60Un92Kfc+L+jjCqCOIV
	iWu74QDHGoQkO2nGB+BiWG/ddMTN8QIU94GFd4a1h03w/pSurF4StTYfIRs1U3KG
	qfXrd+lmWIH+KzKE2a9STtJAzkGdD+HYIccKKY8t0Uy2dw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96patv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:15:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c530da0691so475126185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580148; x=1769184948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC3BgfWbRTghJiseDzpBiuOP0ljpxEF3ruRFm5DAwZw=;
        b=Dl+zvoemZiqevFAGLQQ4FdKUYY+J5x9t/CKxDqwb3AxSVoCM52fU6TYK3siN96dmQf
         XfRP4deliMCYaB96c+cErvJvbvGwzVmS3rHlraA1gIIGsVe5wGdqzbub8fxk5y6HaJr3
         1CabbHug5YtgyF1ZrTvxPPzU/8MtRFi3FnfTrMNSTJY50ov2WHpPyAh6f4pPbQNXxifa
         D9XxQK6aNGDTlCXO7Ox4I8RbDNuGa2/4uw8nxJiwonfm5Qa+iuec53hZL3oDMIIm/pYn
         L+G8nuY2pfAbi0+kveWU3pyzoJKyKhbDD+YzkUUB2FFSsNR73Z0gchClGgNaa67kXZhI
         +zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580148; x=1769184948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC3BgfWbRTghJiseDzpBiuOP0ljpxEF3ruRFm5DAwZw=;
        b=VxXJZBScuS9ya6NoaeL4iS8FG36Xrrh2UVtgVZ/NRWioCQFn1KcK6AazP6KHGJW3U3
         1NgEGMOGg4jFFyqbBieAcv5RnVmKnAD+dgqMzi3S9cdsFYWEYj78hk6ZgSNS3iGGLnBb
         dohWdfwPcw1e0e7jWmikV+XrwO7nXbvOgIpmuyz1uryIlCGAIAGiWYtFcI9fIETr3/fZ
         PEcbhwR80COWsLaidd6+Hs2QBEypn+KW+3xxM8pWA3cimdOuM9MXA81tDrxwL5zjidfd
         IGPYp9pDbGpEkwF0WUVRa3Y1cvHij9Lh+cjBA8d3Hh91D2t9H/vLK30qKAk2wNGaW2/D
         g3WA==
X-Forwarded-Encrypted: i=1; AJvYcCVI7p4cIT3KKIb/jpN6mLUYhZa7A7hM2xhg7heOTscCsg4DIY2Myzom02hDe1ToQ74QI+1k0/oubDKoU2gm@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxKNCwYxvuGdsKj1LrxFH1SAI0eR+UBXh4wsOtc/k5d+snAid
	DNyghG0oLiUK1jdtTSosTj0j7Sc+sPJT9AaYQvuidn8c/Yy/DB5s7ndzqc9UPSVkdsZMMIq7QVx
	CsfxrSxYeHQ1dPP5mHzqb3vn2kGjoRhEYF897bgVSRtRpHy4yJ7hGJF0ha4GbapNNLwJ9
X-Gm-Gg: AY/fxX4TA4vcB7OEB8JElxZdHhKvvqe9X4ptixfX/W81DrNPdRXp1/64aBz7tx0NW19
	3oJ3MQwSEkz2GA6LvF/PKcUFUVBgQdS7WiFA6OYQ0TD1hkcQ8/UfBnmIQZwDEy/f6ewvRZBx86I
	7FP1QejbVsMUu2HALcxZhfW6vxdzjJPujZDRXSCark0bcLeRVrVQ3zfXDXxK5JOmH+v+gjTjeVu
	bj34ydk5LU7Y9LULT3Bi1bSTkIWGMhuHP+bL9VpQx/lOtkf9NiVUoyJ13Wx5KjWmxU7cuQ8++m3
	+WOsABD7wa0IFaiYinOtDRIIgnZmww/pgVTCE5lubDGK+0JnNYJ8UWMpajT1f+eWcYKAFM7OZHj
	Y/jxFmC3o7PxQjc3mPwnVgOyMG9pzmUadVddR9emuxriBOacltGX3LSQdukThzhjac8hiquVaAt
	nvH2erWHCM18GIqGehpEOgLCM=
X-Received: by 2002:a05:620a:4729:b0:8b3:16c:1a79 with SMTP id af79cd13be357-8c6a693a95emr438683785a.53.1768580145923;
        Fri, 16 Jan 2026 08:15:45 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8b3:16c:1a79 with SMTP id af79cd13be357-8c6a693a95emr438660985a.53.1768580143933;
        Fri, 16 Jan 2026 08:15:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf351fcbsm908675e87.35.2026.01.16.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:15:43 -0800 (PST)
Date: Fri, 16 Jan 2026 18:15:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Message-ID: <nk6tdbjn7hpuxfypxgcfuzkbngwj6fsyzjjshfhwt2fmxy25l3@47k7b24jroy7>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfXw3jgJwJSA69Q
 /Wk8KxYkuBJq3dB5SgSK1ANP7o6ZOB4YjwCiqS1yaFE2aTfTdN5sY/K9kcG9KBtXsDkT7uaMGNu
 vehVKmMls4gP9ITsHwURnuNSBLxtRQ4jth9weHYkt9huCRqGNDaMs/g1aOMm01QnMIDwxJxmL00
 1rROYDXBNrUR7vpItoWjtY3E+IFwWMFlUjsBBglGAplk3MEHLJb90UOTY3Ljt/SKNJEPKONbCoE
 GfwNpEkQ2jTAMjKKkIh1/UA0br/t1FQ5Ro7Eumn9NTUBvJtVE84HW+YC+qID0KLij+MhdNBCLTY
 vTKS5UIU8rIQp7A+BXVOws3GuJRcZAx540RHlI94Zg5G/62wOPKXWH299irTW8ENx5ihkNL6A5N
 ZNYhF+EXYXCADadQrKsAEkllqFxmL7dJbcKYycyZsJxb1eU3buPenE19n5k/qf00QQAIRXz5H3Y
 ghifFSwXKqoQjPjFN0g==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=696a6434 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=NEyQqhXCQXLKNWlO9YcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: AY8aGBOcV2P1FTjHie72f_RkkWQ8OIZk
X-Proofpoint-ORIG-GUID: AY8aGBOcV2P1FTjHie72f_RkkWQ8OIZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:50PM +0100, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

