Return-Path: <linux-arm-msm+bounces-96700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBW/LxErsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:30:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9C251FFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB3133A29B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABC038B13D;
	Tue, 10 Mar 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5ERCElp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrAf7AyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8A391E5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151939; cv=none; b=RiQB+jv6weqnWWxhuI/XQPi5Dz0t3dCgPEDvE2JqQBZ9/TAHToLAvzUJgIKnHQN5hAClMgvw4CJAr0kWxF/Yb9TwhzPEwoyk8Q9NohT9y/o6i6OgW28FDPL+7iSwUoIWW02SAmIKxVe7hsli6DtCCiNqxAczySDySsPArB9081M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151939; c=relaxed/simple;
	bh=Kqn7x/CgHOCtjliiIZrKXiQ3tj99UvGsyutJ0+E83QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2BACIyAoSSS0/sSRb8KmsEWF/bYsv2tpMfyA9rDFl4G9QaOTN4c9A798yYgO4d0VZ5qH6blcTty+MTsp+mkDQmZWgpHOQ2O7kHK7mio3nA2ULYc70U0uev3zIX03lSq2gwBi/e49O52Cn+IlmEhPUgdNcGI76m8a2qJG+WgGFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5ERCElp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrAf7AyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACbBJZ3773193
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwQRs3OinF0T+HUdATBj4XocoJa8DTta75lo3fnEfCI=; b=f5ERCElpANUhx4Yx
	PNpi9nXyw+Qy0AihJpCBPJcv+bB3hDg2Sufx19UYSCKYQsUEAwxGzqAThbhLr4a7
	awor7kBqH7nZ05gse4MzdNIaTiZFjyfzfqYCAbM/f0hupJmDJgPuM//n8C8ZDx/6
	H1FkDOgHrZZWNhrALaMMIXsEp6qeh6yIA5W6TOCk/q0nugL1c4MOY3YEAawhLBLZ
	a/M2s2RK2dpLX/bDVNRONlEypHCLPLq2V4BvO+CeDDKva/d4hGXtrpdNdyVuKtpl
	SGrF3xIN+QUjdSVA5ZCGej0QkdCQAf2ifSDTN+AF3rx8F+B9hpsGfBT/bhBpbUMm
	C5NbtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj1e4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8dc8b434so132509485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151936; x=1773756736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwQRs3OinF0T+HUdATBj4XocoJa8DTta75lo3fnEfCI=;
        b=HrAf7AyYh4i4mBdo2qyGIDx73MwjDnSqDr6iOaFU5m6x9eEWzrDcCgpoAySVbAtp5K
         w49qUYjiGT4AaVza5O03Qq2/KFbYa8bCQ2wyinw5+KdkQKf1XTEr9YdCWdSBVhiQ8VRG
         Pko+BcnvVe1EELM4K7EvbzVEXWZ5xaLV1oLjYNqfBMQxp15TSOvTEXVTeqcNJXcwBHgo
         o8n9j+I64FvPRALRwopJ2iLIyTxPJBEd0pBM1R6nMt6erRrw0ZndkYi6Jt+dNMb3LoRv
         K5j20kaJCNaPEMXAhePNiS2p41pUKhuiS15drbXvR8fHZZEk2z2bRGOLUlL1Iaqa37Bu
         wtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151936; x=1773756736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwQRs3OinF0T+HUdATBj4XocoJa8DTta75lo3fnEfCI=;
        b=NtzUf/xLmzPPNk0+g61sbjSIrvLqmBMrHYp0xIeH/dlUNjZG5T48EHDorpUhwRtKnD
         IT/MbYw9DdQHnGb1TQV83cMAoIg7rP7aUBo4BF50EMEAOscCl9bU7TXbOt0oUtIHQxL/
         XVKAj8TCela0kSRzghs+JwSRgZsDpMEA6hYa9IpssWgyC3I9aU0MrqYoeG0wFIw7KLv1
         eRXN+e37X1IxuX42Gwtllpp8BKGFmm9gaQKMaYXA0F8GDSkksFOmRnUAwYUiN6PJzJPi
         MWnKnzFZUeXaqc6STyJI39lUezBzN4LYXvBMNZ/tbD1ybq5WNyc0bompSZFDlmO5MTwy
         yKAg==
X-Forwarded-Encrypted: i=1; AJvYcCVXPDRoqiHiKZ55D/h8MzAgae9WMhl4NTU17zKjhgZetR7eD9tSLg1Qp/dyEJ3ez/JYQmX0x2F2/Zglu90h@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3eesXCc4bd7Ds2OrrFAZBEq+NJiTJYITAcMVN6JmGWBwwVWy
	TYqQWmbXsAO1GzFbX/E4tVmzwo4U1W3TVzciyftyjcqky4a3SrvGthzp/QcPfmPxHdF/ffj7WiL
	trtkx3b/VNFOYLmZYVmGRKyjpWWmyOAbRndZxFpGNOG0fuN2nR6/2L17KccvfY07OJIpk
X-Gm-Gg: ATEYQzz0K9adwyMwsfAztNHF+uHnHt+7mAT2wv0fXwKs2wrhI74fbrngxZrTfOLUPw/
	StCjMLpJU4Z+ELnQxtU/JXSvbF4SQPm4qxmQ8roHgQurKIqJBGWcK2bPo3okZCnbRqKZTvlxb00
	X39dl1laRcddU6zS6E0IHMt4cg7dCcnRlNN/h3XUwMtsZPlFOJdcghPUOEPofUiYRnTgxszZrFC
	3lW5fwqjE0xB6DPMrB0Zk/Kgn5k5hCHsmqR0uMPRn64cuwSUXCI1wXc48lE5XK2exGdb9g+RK3+
	GlsDyropD0BhyiKU6oxgh24C2rZOixCWaihsbETA3riBmFuZeIhZihrZrdGGArOx8LsvXmzAcbX
	cFJqUy2jlfAPX7+UGEBJAO36e3FrmJsOpfXii4H5R62RiP4OW3s84ruRBUQFzVOqmyflohEvRIT
	m01sc=
X-Received: by 2002:a05:620a:4711:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cd6d374b89mr1582351285a.3.1773151935950;
        Tue, 10 Mar 2026 07:12:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4711:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cd6d374b89mr1582346485a.3.1773151935466;
        Tue, 10 Mar 2026 07:12:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-662a07022ebsm1512263a12.3.2026.03.10.07.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:12:14 -0700 (PDT)
Message-ID: <4cb2dacf-801c-40db-b5d1-ee99d083fc90@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:12:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] arm64: dts: qcom: kaanapali: Add power-domain
 and iface clk for ice node
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
 <20260310-qcom_ice_power_and_clk_vote-v2-2-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-2-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b026c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z_dnvKGLtVwtNw_c-ccA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JX-B9d8wJ3AtOrWnz3BJ0arnPbkjEknS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX0ZgdNitihhxI
 31xChAVFIHE+gJHNB+p2Dhy+2ZBIRgOjsBG8HYTSJA27jFn3Kal+ZFmmyDP5yzT4t4LL7DiOJhh
 Il3awyURJOiHZGimGuum2MeSwr8SsM0TfMpW+9lA4wmndf6cjjgU71QpNJaYxUbFYwXlinyka6n
 VjK2FlL2to4WXESIl764drm9+iwD8DLOnofPNEHx2dsZexb282+4G7iyqzVChNClV8Y55gMRAwH
 UrqG/kK0TuJzqJu2twquvaQLmm66qHPTlD7dGWew1jXQWQy51/THBMUUJV7TrgwVwz7sQ28ezWl
 YnHf/S7qCaXfQAI09CBMdwDsOnDcMG32S1B0dm6CbPFbCe2FpnqiDCH7MZqqWdnH7zirHdZ/pAz
 272G+X/AZCC3BOEMl/xOA75ZjbcNfIbhyZPgDTJXTT7l6g0F4hhOuzKcqYEDRioyEiEZF1Mw8vq
 86MdR9VgZoRhzciteuw==
X-Proofpoint-ORIG-GUID: JX-B9d8wJ3AtOrWnz3BJ0arnPbkjEknS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 26B9C251FFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96700-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
> kaanapali.
> 
> Fixes: 2eeb5767d53f4 ("arm64: dts: qcom: Introduce Kaanapali SoC")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

