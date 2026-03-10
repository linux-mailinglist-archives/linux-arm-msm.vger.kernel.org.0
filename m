Return-Path: <linux-arm-msm+bounces-96706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLs9FJ85sGlbhQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:32:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F12539A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2280331C4D37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6E7397E70;
	Tue, 10 Mar 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgmMYoQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzuzUdtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7839BFFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151983; cv=none; b=UeFq4mwTfRbb3xYqonFX6taGS0eL+qtXjhhUGd4jPL2aqrALhEPwvMDR2FvFTi9Xz2hdJIoO7VbGqMZvTHd4kaezL7eCrEhXGJogwC+K7ZsCSNnk/XWIiHDu+LyN1HKoAja2up1iJyc7Z9c4yE0pegpphR0KlkEaRPB+L491hOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151983; c=relaxed/simple;
	bh=5e1avswzIdmR90jxg3X+B+Ty4A5EkdVEGxOjLBbWb40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ftoak/q0nNlyh9KgdBe2lFWCWopA+NyXSBG+mlB0WzZIYzNn3Yco1/gyxf0J0KZfvhbvjQcnlrvx4bNVFuP2ssVEmrv2iK4PtvGMRd9JQiSa+s8A4GNTMbkAhdw4lqfPlslzKdWD3lxA8bgD/Yv4yJ7X5LeLCPan/+o6RIeAKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgmMYoQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzuzUdtv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUBY2861882
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viDjOwaw/yqQllLUim5qk+i23DOu8Ji1UjzfbpgTqK8=; b=pgmMYoQkeEk61lUi
	8/A6DcPji19sWHbMBixbgYn9jvuX5P5DEjbgVf0om2omBa4g4kjpQ9kMq+G1zC1v
	4EZyjHFDTO5Xnn68sEYljYOeDfB28gjxTIDuSOa46fhB5zZhe/oyZbGZnz0oHx9y
	QRK359kQHLf+rJwaw4Gic2/bXvCaTASNEH2WbTHkKtTByZuT3sH1F+Wb7nsWo2Mg
	YgBAxQ0ZwvoFYjxL+Hjsn/RjhFE9AzCTxLpQXT9HQvVuhS79X8Ux+d6RNgtAuLjW
	vwyxYXVUW9GHjC2A/1V519Nk+xD/2/eBYhieHmdEZL8sE5A397u0LWyU/uiWZl2n
	B14BaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9p6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd97debc51so39149885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151981; x=1773756781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viDjOwaw/yqQllLUim5qk+i23DOu8Ji1UjzfbpgTqK8=;
        b=QzuzUdtv5sp5QcF9fGsTLespGvWfkCt0KbPV9+ZbmpX5CZ5Qq4k1xFD/B7i9XXI2d0
         F04z2LdzOWt5HGyLpyN2O+o2esKOsfrId5gA0K7qk7eS2LKhr60qgm93YTQesfJAJw/Y
         tOH5Bcbky/DCWgyQPKSDvKXh/IZpHh6CrTRTgjKcC2RH1WK2433N55BKQUwar+Ed7RFs
         06I7kwCLW08yi4lvjXEr+DBhYwPRAiegV2whj+YjHf3qGddh38t3qJ8o65TH7PiwIRiM
         3ty6D7IQIBmwD/2IQRgUAeYy+NHsJgwz5Hv3i22OegUryI/JXo3MhZva45P/qgljso6J
         WgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151981; x=1773756781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viDjOwaw/yqQllLUim5qk+i23DOu8Ji1UjzfbpgTqK8=;
        b=FeoVJd9iNBrTAnX76CgyjPw8gSQJ/1XDT1GSdksBwJfqOTKjrIJZtD87w5CQGCKRmq
         zdKg4/apUcZ337xKRehK1qQr3BnxSPvf1htQKoPAddWtbDWe6rpyW3U/+XwWSp2e60ip
         xOZNQU4JuNo7fAihWvH7+4p94anWe7ahyofbHoaC45DZItXsC4aLLNlOxXU48zUjISJH
         L5Bn/1KHBLtwpcaADnEQ5nRk4tav373Pzr/qZPqIsS38qmbq21P9wwn/8F4ty6ahfJUC
         NOdTAmusKcOevRlDfFDhB9WIXcVBlFvgGBdTZsY1Rpwsq7GnGUhjZ/83XRVIJAFV1B9p
         SszQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmMzuCA/qdqPlfI0rcubZ2YCNjEgoQyWVt31PUesOONt6AQDMt+fPjQ9Sad/z654uEw6JIy9nuqYW0XfAn@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1AQHut0iovC+8ZjCVEZn4OGES8eZn9OnSqCbb/5DuCBObTsL
	dG2zXrFAC6bgh4aJRChwM0sGixxq/mI2xKM4tA+20E0rN7bU0hloj8TwSuzwmoryBEtRt7t3PDo
	kZ5YsUgwuq86KcwX0ZBef72qI71pu+7/k6oDgMrCoQoGinblxKkJtlaRJfX3Q8nGqj5Fp
X-Gm-Gg: ATEYQzzJBb5ev5+TIsKaHzlHh8aCrHMiX9i2hFGTs+S6gZSkpjtcvPeQZX9P4hqKhaU
	UORRvQt+40TOlpB+dt25B7i4nmHes0x/bMLlteoY5N431FdqMnGb9KNSqV2GFlH3l/8z17HYd7d
	KsbZsKLdF38kx8AlcFRGISPY0E6hR/vjiIlHknj0sUnStZCGU/8txkb6Kq6zsEEKOC/14bz/wSg
	PFq947k6WTpA0zhKLJ8uL7Zdik89HZnJg9/Y42d85Ufqi07ba6f+2VslgFHSj6L1MmW3TLskUEp
	nj2Ex7K+dsA+PTa5cyEH1wO5c0de7uNbYwKvQl1I9jvvlXO6hFNMz3sjKynENZqEvPPZIhwwKRc
	m0I6g7bSGUcg8vJcZFAOllWA4zkh0yJOGbTlyQaYr7D+iSOwIs6+Gx0GGF1c3vmd/5D4qkmvIu1
	zoRb0=
X-Received: by 2002:a05:620a:4087:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cd7fc0f6dbmr1089001685a.5.1773151980760;
        Tue, 10 Mar 2026 07:13:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4087:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cd7fc0f6dbmr1088995085a.5.1773151980118;
        Tue, 10 Mar 2026 07:13:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm4317323a12.2.2026.03.10.07.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:12:59 -0700 (PDT)
Message-ID: <33b27a0e-d369-4311-8372-82da4c331256@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sm8450: Add power-domain and
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
 <20260310-qcom_ice_power_and_clk_vote-v2-7-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-7-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX9X+JEMmtOIc6
 NWx/wtTw1L/QJaLF1SfF/Cj6sx2mEbHAZQYSdAF5tyZ2HJPj9HtD1ixIaMZjAFWmxNRgxTp9BqX
 y9mtlaF+lvGOUAgvVFGnl62DXDhyC2dYbdwIBSZv/RKCvMoopFmH5LlFjiTmTQCPf34jLZyaTin
 OKcs00EehwvGi/0gFxDIaIifILt7PMK8gZxr4iLXQhcVjnd33no/7VZkoZ0wl0r/RqHCQjXgQfG
 NskSzbck4DOVgTq/7S1SbihqTGxMEP+2/1a6QEpX7ILV2vOkgWf4XXD9xMgo26w5CB68+HPyer7
 CHBXztxRUbnuPY2ba1rryONfb0zfid6Dq0ms+5IN0ziqfj1bK0XjMM/m0PBmiw0Uhi1oJcKTt1e
 0N/RCv4LW5iDvrT8F+SFYqu0SNBxzNkdA8qN/A/7j5niwzLTtIdrLIhi/Df2MTr2dnUKh/xWbYa
 E/tnB5+y49sT3ek9sgg==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b026ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z_dnvKGLtVwtNw_c-ccA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MW0yCfYyZf1gvJlZS9ipnxIehYgJ3M_b
X-Proofpoint-GUID: MW0yCfYyZf1gvJlZS9ipnxIehYgJ3M_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 4C3F12539A9
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96706-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 9:06 AM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.
> 
> Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

