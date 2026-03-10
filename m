Return-Path: <linux-arm-msm+bounces-96709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLkpOk00sGnRhAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:10:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDE252F66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DDB4340A153
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E8C3A1690;
	Tue, 10 Mar 2026 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhG9zUjC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdxYIKp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C23A16B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152006; cv=none; b=ss96SqsTyzxiw2fa6mfdB5aETO/oJgBgZMViS53KFi3dCxBvopj7Y/nMA4i6Oc8cGZdJYFR91SSlc0vVnbpd6wn/744Gf8Ccrp6DcuH84YOLPe6SBFR3sCYixHn6MarWsT/VYrZmk6z9hD8ER7h1KDCy9FtEnlkvJdckNGPMHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152006; c=relaxed/simple;
	bh=O4BqC7xKtyuYLJXMiicZ8E39BCLJgP0YLen4ndYdMCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlqyUbNjlMHXdIcy+H0Eu+fLzexJUkTzJgEI3rTMXk0W9Vpb8sjThXGotndbekTGp/cwFmdHbGZhydfWHN/Amg03TsRfZBgz+XIRgXUFkRAKG5eGWhqsO8jWKupQ+Oi3KcZoQ5RN+ifQhwnZTkPPulX+Rciv8DioUqAUMTN7+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhG9zUjC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdxYIKp2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUIv3771883
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKOFavLkplwLvk/5s8iEokBvnWPtbQSEsRHzYQNaJiQ=; b=JhG9zUjC+85y0Htk
	zdPQPeXFJOFkIxdUcnJqvxrDMezIid60d2AU8tdkqKXgt1Md4tujhR1g7A1Shfus
	FXkkj2zNq7p6mDx5qFZmGuUGZW2sCAzcdkVlgCiZWYyMt5XTRgUPHAXR4wnlsK7Y
	Q0m6yTot1sB0StYURmP65utj4ifluAbLK3hnKLNOzQYhM00ZIk8b8T57n7IeBmcB
	nhkXzEyYubj4cm5w9r5AJphyr/G1kkrpUSXNpi7k9mAXdIc/Tij+RvBQqe+pAzWB
	zWl0YgxEia6viOQHFhg2jbPhZ59lmAPsko7OD+t+PWkb1fcFyF9bGn50POftkwkg
	BEBt7Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj1ea5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffaa21ba15so1279810137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773152002; x=1773756802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKOFavLkplwLvk/5s8iEokBvnWPtbQSEsRHzYQNaJiQ=;
        b=BdxYIKp2AiHmaA8kf8emIk8wAQbIWxfTe5BLRXDoZ2fr1k/zqMNNHKBNyZakONL/Sc
         +x4b9Dw8AvDH1APCTwndXExPOwBM36ql5uMtZzlGb+dnYpoyuz81TvMlpp1EiIv/nFfv
         Pjs0lqFB2vzgoua7cYacflCqAvJKx20qFNT6g7bXWCdF4ZRGAy4wVbVIPNGG3wTCQZtj
         zT5CkPIrN4KLMOzJ2UJGd6HsLaULsNtTy5RhSMwVe5aIVqDlwzW17wBAsW8rAL30rOEa
         dc5YO+rNgVrU8axbjSZOq9UeoT7V2GjyXsGmeMqKr4gRFz5HLzR/nGai38Sn9T20V+2t
         4vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773152002; x=1773756802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKOFavLkplwLvk/5s8iEokBvnWPtbQSEsRHzYQNaJiQ=;
        b=C7mCLr4SItrYiKLVrfPXHxjoFEOnY/v2lQpsr91/q8aGGvjndKKgYM76khKd8128jV
         g8npC/Kcgw8udnwFZHX7UiSJAQtF30l1Ri959IRQJ/DqOvtwM963P26g+2q/HnPIks8Z
         cx/Vn6e6FsStg3bqgBXstWVE6lvAFWRrtPm8Ztf/JmS1HHMR+F5vaptlEAbj7mk2IMJt
         njTIQE65OQ6z6lYGLFqc0RSQC4DoO2srBNrgMsNhckhYx8qm5/mE87diL40qNvGZ/yew
         VE761KkrmcUVuW93estbUmp5McFSilLqWocf9beyRrjVNzW4FkDrRxN+R+AJ4QqKyFJd
         cWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWHBXWD62pjWyl+ZU8QZRAL0nQMZMrZB+sxyK+3ioOcM04sPVxDZzMSO4CZCihDSCxbIoODxprXLG2bWxG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dyh1zNbv9TjZMPN9G92VEhyLnF1E6aVgsWtSwTetyRg1J2G8
	+Pu5fcb/uhsx4Ch6w/9KhqUwekKupgtbFK87b5O6evXjE3tshS/P/neJTyVzVTPfxMu6oNpjLXP
	xNgXXJh1BF0Db4pKmquyvs7BH7wTFg+nawAtHT+PeoSmzImM23ZKJiXTYYnW8EOqbMIEg
X-Gm-Gg: ATEYQzws0Do2fTY2xBoHyRZceIRS75vdN8XLfGDJShS0+OYcAPS8GpWbCN947lN8ilT
	B1R+1U7G3H2IL/UIuzJyEkdtr92zFpVctYOInBp5+NkfrHuHHwDyF1YWSrMJnmLX6Dt2Y7AbF7d
	YtFN/PpO+SSKZ3cBWuQnEtxDxDwpiASJEaJvsRVa9Mbm657OYWQ1je55uiqO6lmyTmTHVXrBwyq
	0/6IreO99OU5hGuRh0UiwSfeKif6ycO0BPufnLJPnuelrsG8n2befuwQhmF1WgxP+SoR1Ywfm5q
	BsOXMaeAZ+3ybil0LzJFMqonhzqDK9HQaAPv0REGyUcJ8yI2v5S8dc91kfu2k+C5aKnxW+SizBs
	96H+YidsDz8XAKNupZz0MqobMBvy2VCDJdLQYmP0wv8sYnQqqOJ4sJBzaDBfgJhrrhbN6wziT6W
	dJULM=
X-Received: by 2002:a05:6102:c8d:b0:5ff:2cea:c17b with SMTP id ada2fe7eead31-5ffe61e85c4mr3065734137.7.1773152002052;
        Tue, 10 Mar 2026 07:13:22 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:5ff:2cea:c17b with SMTP id ada2fe7eead31-5ffe61e85c4mr3065721137.7.1773152001529;
        Tue, 10 Mar 2026 07:13:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15d51fsm493523966b.53.2026.03.10.07.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:13:20 -0700 (PDT)
Message-ID: <983e115a-dd90-404b-bb8f-71b28b33fab6@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:13:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-10-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-10-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b02702 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z_dnvKGLtVwtNw_c-ccA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: pspWI7ECSLaN6K6vOAaWW42Fz2CulCBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXyu7hsVTuBSlD
 DMdGQQNKAZCtphYMBEuoxoHJF9ILk5J4YkxwSlGwemIOsU0urJwDJDouV94X78tSQYL3Grlict5
 Y40x4SaJ2SzM1zDEGCBkVeBsNay4KD5pePaeW7RRltLoSY0s1ri2nWS2FJbVZw2jZ5XGf5/uIay
 41xoPHJ6eOc9NdiNsCdQees1ri3yfYeymGhkgfqo5VWX3IMINHwnYqvMdPq4bIkH+CX7VeG4eEx
 BTjlhDllDes2hvWiPoj/6HBmaBb9XU8psHvqI2HvBowct6Y6zgHsBENRN6B9Pjsk0OqGu4iAJ+4
 LJywZ2bxMPf7dZRooHUM0XMx8Eb/ADzNa8/8CkrLn7+wDvN9nHFlLY0JmlKEjtP/7LoRP8ZFriQ
 f3lU3hS5OXA+NJeFujuLycZr0cLmzY4474ygq2Aies5UmNbIyn14kyrLBvh8cmIriTOX80Ssqtm
 n7qNVHzU9LEXA4X/fFA==
X-Proofpoint-ORIG-GUID: pspWI7ECSLaN6K6vOAaWW42Fz2CulCBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 6ECDE252F66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96709-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

On 3/10/26 9:06 AM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> sm8750.
> 
> Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

