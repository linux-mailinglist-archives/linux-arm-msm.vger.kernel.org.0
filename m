Return-Path: <linux-arm-msm+bounces-96701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCPkLdQ0sGnRhAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:12:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00A253033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C57A33A8EA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BE838B13D;
	Tue, 10 Mar 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6+kh1Ie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoSi+c2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19A3391E62
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151948; cv=none; b=XEuhmbU7fDOKCCcstuZecQy/dm99SxQ5UkVjKZQJk5VspIXri+eCc545iITiSlN88/7Kp3ELvVk+iSXKgg60yYi/G/Tw6wVGWXdW9dknVmK+QPNlO8BP1wpLjN89U9ISPsA1VvxGEjkRnOcHp30neeV8x5PX5i+jxPmNSvhEq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151948; c=relaxed/simple;
	bh=2PX/oH5yfu8GCXF/56+289Sd+rY/wwgXPJOtAlblqg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AINxk1OMV4dLVMj8FToCQGAJb6/XcBSlfFVHTAOFq4g7McVfeG0UVJtsGwVOANFgf011o+TFgG9llCtHplwAcK7mRFWJr0PHPl4YLQEBbxexKhRGEGOrYBXU7Kgc7k5RgsQS9g5CiRHpb7quuy1LzvVbbGhtezY2Cv5O5Tt6nJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6+kh1Ie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LoSi+c2K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACafSD1503509
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/mbyn5v6NwmEdG+6B8c99cOQW9zb8utuqxEPtdWgWeE=; b=o6+kh1IeXIKYzYbk
	VoonwtXepckW+lS4nuu5BwHJlnHejhovgzwOs8H8iTKd1lUj2uOTZ9yO6umltrPr
	v5Ow7QTcZPXW7PuWCRv2sQJ0MTwiOhQzPZA1J4WTJOlUA6DMmsFAHq/zdhJlCvc6
	A0rEaDHekdTZI1NSlVEUpKAnydiBJgeyha7fI5AYC32y0BGwSoiEgapWPDAW/5DV
	7PrqiPrNgYDi3iEXbbzWXlpPUUVrUXI28d08EsBM+FsH4SJJrvkO9Jlt//FhLsZZ
	tfybMKAI4Ahxg4ZhDs2ENHPv/PGHDUnSneRNsQHVCIiUzigpWd+kGdQboHwsLLpg
	ROp53Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8huk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ad73f13bbso1834780241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151945; x=1773756745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mbyn5v6NwmEdG+6B8c99cOQW9zb8utuqxEPtdWgWeE=;
        b=LoSi+c2KjLRaxSvh8L6OLxRetdJIQlP7Wm6Ry4MeNn42DXB6nughtvdFUNWyJYxqjc
         c6KJvgweeIk96HOVrNSivx92PBFcJBHZ6wQ2vPTp/hxQTiIHwTpWFBEGycXWQEw5yMcG
         s+0YE1DmvEg0AbOEmKmCkd7rU6TRAfJ4CbWRe/808L5l8qRk6sklZfOCkwZWHQ+B+V1J
         uu86qxrG4owynGJNDedN9mEuP+ogUDfTxgmDBX6vXGwHuF7XQr1zXGZVuS24qTbW1wR/
         sBw4vZPoVhd7bHx834HXs7FjaitLt7UB4MqOC/5qd6WI8mOXKdtRqtl62lnshBWfDbAS
         3ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151945; x=1773756745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mbyn5v6NwmEdG+6B8c99cOQW9zb8utuqxEPtdWgWeE=;
        b=JBgKqMOyRx3bowEtgNCxmV4Ykz4VgqqVib8HftA0G7DF7lvO0OiAZhD06xpq6XrhSb
         OG3K2DhjcVH8jF9wK2d1Gagvy7ofLn38UMu0DyTUV1eSAJhYD3VB6LRw0S9bOv5047LW
         b0diufMaVCB76idsB/w3YYFTn1uJx9nIrXrCHVpU6fdtAp6Ff3qyOVgmPv+KMe86FlXx
         lDRFxeH/PjasJZ5e7uL2hqr1yABJlYUqKLYqjYGgPfNATb2Cq6upoEXlA3EqIZSjK8hO
         PLzAKVSL4gxJTtxcSPkAeurF4LOhwHLwznTw0Ox25VM2aTto2QGMfF+OsHSpRMZ9/acT
         gTyg==
X-Forwarded-Encrypted: i=1; AJvYcCWHIZPi4GaosUX2QnbVLFgRbRgeTqXc3URecXeQVip/ZW/ZfhPDYB9zjqCBvgKnmGyW4ZFuuG8dxnzRC2Px@vger.kernel.org
X-Gm-Message-State: AOJu0YzcgpdO6wMEJT7FmqB/WQSWB/dWGHDxboUhbCWUxkHnlMqpbAyQ
	IbRrcrWWn5i742vyWfNzg4y8OpPlcUUM+Xfo7bDrwRD/GIGmUHZncFekEpTg1EHC2ewZHhp9zOz
	CaZrJk1IhwMNbQzhZzCyeUecRgzkpKbqgiR9tkZ/WmACeUO10t5sA1CcPPEaScV7A+Pcm
X-Gm-Gg: ATEYQzyVsDOPkkLLS96AQWPbZEAfFgZLAEvJEx1FjqaXQSR59QIOZvk3br6l8Cg2q2S
	QhLA7lZC8+vL1fQsiCEI1L6SHuVT2ppvbgXLBdJoOK/Va9e/DETJM4vlVn/O661fqjK2LecbJ7H
	R5BILcH62gieorb0zf266dL7EUjg18hBs59cO428zHQNsGmebS31pjmnliPcYysZE4IYLk9dk+T
	uQ7lnpz3sdz2rf40JZpku97uWS5fPL0jkaT8tstggjrAHIRk9t+Uu+lM23e/UDehoXM/NpvYsdm
	bQ/WeUCj9CFM00tRJzPWbl/i14IeOLG0uyDjD8P+L06yS0tSnC76ckThEhqnoU5pbVX2oWjlfZu
	wUEbmQQM3WCq+8v2saPNcNMQNoKjZOIvwciECAAC3ZkPW19LYISilAJnTIQTPqvQh16zA1khJbe
	i6Tjo=
X-Received: by 2002:a05:6102:d92:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-5ffe5ba4013mr2497620137.0.1773151944941;
        Tue, 10 Mar 2026 07:12:24 -0700 (PDT)
X-Received: by 2002:a05:6102:d92:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-5ffe5ba4013mr2497609137.0.1773151944415;
        Tue, 10 Mar 2026 07:12:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-662a07022ebsm1512263a12.3.2026.03.10.07.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:12:23 -0700 (PDT)
Message-ID: <7adf07ca-0ff6-476a-8975-8ecb1239a754@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] arm64: dts: qcom: lemans: Add power-domain and
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
 <20260310-qcom_ice_power_and_clk_vote-v2-3-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-3-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX+5PxXhkozi7D
 RrtQZCH/6qVCIj3tJ/7hK071w61JVUxCE44gwHIpifpqOvuhGzGZRP9ugHz0XsARWv8WdbwcmhH
 v8RB8RgMexjmNkfqJwpGt6ZgxlASes1E870nU2tXmMDFf4kx9vsmrgq0ttIttAc7g5mX0G/1mOJ
 +Lm9D8XdBJ2fy3vviAyo7qeL1G1xa3vwYmbVXmaTxh5ZLcOtT8cq7X3jj634RltyYY1mcdOjnUD
 ksLjGmovb1Mr+wEPonOVjVzSE2rs6Dom9hMHYGL5IGzskQ3XgI6K02B7gzCO1Tmu53ogZhhzdHB
 614YOWSHtTC5n8P6Pe9IvOukASKC9D/W6d3oEXj0aIbEjSrteyqoXagyiQzn9+I7PF6fH/hxWZd
 Zul9JGBisJsJUBU9+FtSmMKajgEofsUlCYxvVPwcmsZpGxTk9ROnN5AtUCosxZSY6p66hudRLDZ
 /pml80c5V4hmvpiRgCA==
X-Proofpoint-ORIG-GUID: 7IS7RXbhBqNsoCQtEvqE-OSOvTLwdsOW
X-Proofpoint-GUID: 7IS7RXbhBqNsoCQtEvqE-OSOvTLwdsOW
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b026c9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z_dnvKGLtVwtNw_c-ccA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 2E00A253033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96701-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.
> 
> Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

