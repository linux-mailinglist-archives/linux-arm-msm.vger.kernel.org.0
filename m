Return-Path: <linux-arm-msm+bounces-104070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMvmA0Km6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:43:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD23444DA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33EAA3011F2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34793CBE6D;
	Wed, 22 Apr 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7b3V42n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyjvBZDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7F3C277B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854582; cv=none; b=dnqi38Ncyl6bveXkxHn1C5nr0cq7aUJRqSc/9WTC4Tnvp3/boayH/WiRAuljGSAvJwWQGI/iX02r5lVX52sfn2ciu0jhEGztTgyZWnpZ475HEkTP1VzfzWZz9pKvPIfByhwtLBDylyx9vof4wt5L/EKvDObTItoJE4FWK1HRIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854582; c=relaxed/simple;
	bh=RZ8LyAzFHHhQCHwVx9G/hYYS0Bj1t0Ro9JS1AkBSZ5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXgG2N+s3rcPuLM0cdbVaRnfnp4iiti71ACPvf2FanIcMWssT8VYECe1mQOGKJfR6AMJuR4lu3Hr7Bwg1y1i5NTV5t1c2yZFOSoW+HZaiTbvOJnvfho3ajQjKomwtsd/ADFwpLj04me9bcwA9aDQd7aKzgMp6rhbU0LraDiBRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7b3V42n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyjvBZDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAUitY976177
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OGoandW6NCRWawexIx9PyDzPA9ZO9OfXwwgw+bG5ti8=; b=f7b3V42nOJR9eQ2C
	QAoLe0G65JGEWtU8Feg6S1LIBsPxtmk9oaKlSkOhm9sI7YPuGPbiSMRf/2H81M2w
	3HM+PP9bJoNeniPmEFetXYdgKQV9iAGUZp9Wbw1i+E+fEtgVD+Rdb2TsmIgq3d+H
	r+6DCRDfHaO5mDh1ox2B6iSvuirT+PoKZG9f4idKYVI/6g8QGm/mYVX5iFKupK2i
	ZdiDZDGA61AFlaWMiiXr1Vkp20T1bm0IzwO1JRv+qj432WxEooSrJ+QOsByRvsPZ
	n95hViauxZvUBkAlOnpa5eHWq3gYgCjrkf1gVBStAyBMwLAWP2hXJy1BJ/3A+8Tn
	YGmZiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneb2tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b02ea0c595so10759616d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854580; x=1777459380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGoandW6NCRWawexIx9PyDzPA9ZO9OfXwwgw+bG5ti8=;
        b=iyjvBZDsuDvcL0JNKXusdbt4hW//n0jP3AZZRUDTnHCxPBSHZBk8tQUohELJWosad6
         Oy4O4BftA15qXMACxgfJiQnDWTVFg1JK8tkUAR/pyP6MElMbTYcaEkk9F6XO9mjGH6qX
         G0YKQ83spZBZkuhR7CPVAbX7VI1GPWlvmNwlb1aC2vxMGBDTCw4Exr+wVmcbPP1zHSp5
         cqIsLycm786Jz7wvNIf6xYzPGs9Ve/+zdSQmHUhpL4q7M/IQSjl9b78rsXg1Xfvp6Eyh
         AplP7VX7bKkd/0iWu9onwb6wxPPDBiHRQB9TS8/M4bhBO/r96gqtZshnedNBzZPCXMC/
         wTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854580; x=1777459380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGoandW6NCRWawexIx9PyDzPA9ZO9OfXwwgw+bG5ti8=;
        b=eCQUxilAgjZawFqOU+v885UCeKsjmmz1DjoVbweuFG5FLJ1FjLfwU7844HPou96TxI
         cCP6RBxGY1fcwVg8/sqdxUaNtsPOCWk9LYgUla0orT9L5HWgEb5c37yy4GbNR7a8tpXl
         azn0JZQ81LUeKr4tvmNUlimHBIk3Xp2hKAUMo0WQaLFdSI+ibamR1y4l+RUlvwT83p41
         YpcH0tzK28OZCAMf5bfxj7/eLvi9vMO787gBFH4rCGdhWx6afC+CzKFKrGpI+AqshasL
         VfevaWraDMEG937OYHNkdtv+cneW8cEPAJMOiOgT930owsRJbJ4r0aas1PxFlKcnP3YF
         +M3g==
X-Gm-Message-State: AOJu0YypYIZ6Vwt3VB2jXNmfkIteOIKCQCDKtI50m1RWdokgHIW50dVv
	0gZBvZEtc1UFuqFyTCcwJLCKUuF/19MCJn2Y+TaefqlpT8qFqBEuU4qNSpdKS2jKYmpK1ilOzKs
	k9UfyWQbqpJFgzmkbTn3P5tdvifoshnWHiohH6PviCtBabPdLY/zc1YQqf/BCfUOy0Om8
X-Gm-Gg: AeBDiet2iyKZmL00FjB77YxNE/oGMww/TpCHH4LP6+vlxi4eufr0fmPjUj0em+FtYHF
	58eZulnAr5tqWpgUzwcLhE7MpU7j2eBTrTRXdMXdMaQ33j5vtaV/lMZQTYCE8I19djJIWiDIno/
	febZkfEiYdXesRHvb++GL5FA/vv48LTjQBR8JgKoROFbDV0yxwSehwxaCCFT6yUYyFCwlWhQL7A
	GnvL6pmuMGqg8Z6IEFSQrdLmOHjgoJP3TEghSgqvkyhDebInHDPFqQdZfMmhHkLaJdAqsa0BFZR
	mCoDPcK0+udND9+s7w8LrtOcXzpluEXhdvM+myYUs1u9gZyzlX7hl7Pk4slqPWIn6CayfQlMYPb
	Ma1OACZBHZEnwPp6byv7i/YlJDzGEmKUI5lYTYRLwkA+2AZLC1teClIC1TZ7UpxwtLkFp0ximmY
	1WQAyUwQmgYK37zA==
X-Received: by 2002:a05:6214:629:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8b0281d4c8amr253288186d6.5.1776854579758;
        Wed, 22 Apr 2026 03:42:59 -0700 (PDT)
X-Received: by 2002:a05:6214:629:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8b0281d4c8amr253287996d6.5.1776854579384;
        Wed, 22 Apr 2026 03:42:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm521636366b.33.2026.04.22.03.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:42:58 -0700 (PDT)
Message-ID: <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:42:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfX9ipb0HgxzgQy
 SVTu3jL4Xh1OZs1hxnm6cYbWCT9CiYA0X/BR4/dmSUfaqCNeYUKn86WYI9E1pl1y/uBc9YIdkvJ
 m5tBOh2aQU36EkuRv2Fw+a6PkWACoh+tHSuPQQFw7LTHe5mDGcvndUuslE8J8M2zgM66kklyr+U
 m2Ys2fEf3YFKaM7Sx3Bzd4KMvrg6HKku8Tp6a8zEJVXh4ys0rDLbym7lVqNiOk/YGVSjBPmoz4H
 9sRoN400Hye9bPuXNPylazsubas5sitlsuHe6OEn3D43JaJr3eu1cl1YYVSOH0Ei6bFAlfhwnUN
 E5ZfGSJPHjKajT+FSL9mKOMkV6WB0az1p6yaejYhMTH0sZYMiBvvHmB+D+uFVpeu702KehifDfB
 427aOZSWJotY1Bg4hbMKzJ6DyGCrDe+ZZCWtoJXKxRKR7MdgGh94y2MRzEHmkAJOuCxx5O8OjIr
 tqC+e25yoUSZ5foXh1g==
X-Proofpoint-GUID: yfpS_6me2pnbwErPP-bISCktD0oiIskU
X-Proofpoint-ORIG-GUID: yfpS_6me2pnbwErPP-bISCktD0oiIskU
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8a634 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9UQlOuGZ28LDIwtST30A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104070-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DD23444DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 8:01 AM, Yongxing Mou wrote:
> SC7280 and SC8180X previously shared the same cfg because they did not use
> swing/pre-emphasis tables. Add the corresponding tables for these
> platforms. Since they have different PHY sub-versions, their eDP/DP mode
> tables also differ, so move SC8180X to its own cfg instead of reusing the
> SC7280 one.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---



> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
> +	.swing_hbr_rbr = &edp_swing_hbr_rbr,

For eDP / low-Vdiff:

I believe the RBR swing settings for 8180 should
instead be:

0x07 0x0f 0x17 0x1f (matches)
(the rest differs)
0x0d 0x16 0x1e
0x11 0x1b
0x16

The preem RBR almost matches, one byte is off
(arr[0][1] = 0x12 on poipu, 0x11 on kodiak)

The swing and preem settings for HBR3 look OK

For DP / low-Vdiff:

.swing_hbr3_hbr2 OK
.swing_hbr_rbr - I don't know. The docs are unclear whether the same
settings should be used for RBR and HBR3, but maybe? There's a
separate table for mini-DP but I doubt there's any poipu boards with
such a connector (maybe some obscure ones)

.pre_emphasis_hbr3_hbr2 OK
.pre_emphasis_hbr_rbr same as above

Konrad

