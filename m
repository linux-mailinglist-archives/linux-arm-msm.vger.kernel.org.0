Return-Path: <linux-arm-msm+bounces-100590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DqyLHf2yGlVswUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:52:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA6351751
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FBAC3016927
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 09:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605D6306D3F;
	Sun, 29 Mar 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBXDthx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnXl+ouP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C262F6160
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777962; cv=none; b=WB5vvg3z5vzvbGg8I8Ct+bsk7CJZVgpl2UALk5w9OHlYd8LVSQ1YWGf3YAeGsQpAil7BEAdDLhUZPhOXUnTRV2MAcP92bZ8AbWRHxLAlL9jdrMu79xtQtZxj39DhWVJkQtH4aZJw0mwTrOe9ERHi0fXBd6P/xMWW6g4/QLqhBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777962; c=relaxed/simple;
	bh=7I1eZDkRK/wdoYxZ7s+Ps63Cn8C3cZQaKdTWPLvtd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+Lzfr69Z6HEEJpLf9tJ8YEdSriA0QWiJ2MsBhR7IE+fYWaR/hQe+fUKBEYv/bWqogySfmbIsmt4UeQMHSltkKzFjsH9gNr+GCMw1UQSFgHeV6SEEp5DuVjJSDP5PXikJwJjTIMNQ3/z1XT7UljQPypszACfcANJQkwFHgH8L7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgBXDthx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnXl+ouP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T24aZd1291764
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hAyNkY+C3fVpD3lC1c6+6VJB
	YgiejZKZd/p+VA35QAk=; b=DgBXDthxv5tldkiJRuVhdhJOm1JntCp8ib32vvFd
	RoBiF+V/tECzgqQFTGzs9azaf3Kb7oG6v0MhZzhdQGzhNXEC6b7ubvFu+QNZ+TUt
	N+tVoeifX6wP6uTT3yhnPvxuXtNw2UV/SNnqhAiIcjk5PA1HwzB6n5XMycT5Z4Fx
	cOcTh1lVqwNYqbp0UJdo/qMTZeeTPXm1RwtRmN8oYkVW9ufbYq4WbkneiLkTuiQx
	OufqQEIixd4QVQsZuGxRhqWwGp2Nok663vnGN4CcncCmNxzvFj6hIhSBpTJ98c9Y
	cyAmjXYZk2XxDjitYA4Z/t64eOC74HPnFcFbOOs9o6UU/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7ah6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:52:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso104090151cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777959; x=1775382759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=dnXl+ouPVigFEwqbh2pAOGlvFbzv/+T6ea/PFG9zJhKr3bSLktCImrQvBJt+b+U0HE
         Y7gPQ2alC8JUaluNfdvvSipJtiKTtDh2feUz5vpTypmLTjU5BnkC15neFXdjvKdFUXBg
         50EBgUJcir1xyih6Ju6AMI/PXwo+wj/tp3MB4EywvgX0fA9TYCbt/2lnvnPbrnieHFX2
         BxeogZcOVZB94yD710xJNzrLYwZ5ZZuUPy5j5MAw0xyqQVji3aUGij6EftjOJGG8ifTC
         Iv2mmBp0kadMF3pR8dQCrjYJG7ecg0coMpDgkP1QmMvrP2/zrqLhveKglJwSPANd71DQ
         i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777959; x=1775382759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=jgVm5Z4Qylb3V06WYbACZcDCBLknIPvtLO4R78GRV+ZUrBUhz4am/XC5C5ztxN9ump
         VUU36mTuDd3UT7JIzwq/G3xvnH5CYYfSngdaQbzShlAudj1Y1KazMwGG3EHmNX3eZODk
         rm5V1RK51wr9pss5PpAbOF0z0wOku6PqgHux6co7GdI/uPgymM7Hg+ObTcOvPLc4CDK1
         sRS/5VYvEpwXC8stW8LPpsgXBYnuuNdHjd0KzxDwhMlZEzG3MNf3Fq6NAsa14QRClTCM
         UYjDUeMVoO2nsUUEdvOqgNHSANMG8lbpKBzAoprKlqA1CPHT7EfH5ZTpU0fE3S8rf2iX
         LE9A==
X-Forwarded-Encrypted: i=1; AJvYcCUhQGSgvTthEDRwqAoBSqm/HOI+h2g6AsNCpJwwWOO8idOKGgJTbmDPOGkdnNvGiaCXtxDL8X7e4XvfwAsj@vger.kernel.org
X-Gm-Message-State: AOJu0YyGeVp3io2LgL8bg0LQdyMvUIOzIOxQGbYm4jOr5n9iuXOUvsg9
	FG/7pntWfRgeO/l49NuYiE5OI28g6zdlCGP7jhxyYq6WrREapDVtPa9cZDTWEDn0qXnyT5Oqv8H
	1Kqh0a2uhcf0TGSOxJ6NkqOqRp0czush5FVHU5VG07t7shF3Qbv0XXnB1PhTKW5iZ3GVs
X-Gm-Gg: ATEYQzxYwGqXQS8OedQ5O1Q2IUfl1UXREYJ3SI9LIuhRnrzQWceVEzWS+jjxBoBA5+6
	tAEuDm86g+0FNWZpNS0vy6yKAdQehD1MNHQWN1txSPH74JL5YW6L1/mG8H0vz/drkS561neH33W
	Ud1GyBeDSZA8vOlmRDPtMzj6aAZ5AObOJLVXBaobagyhoWBdT7HP2zSEaLAEL3kcQf9Hkje/UpJ
	vnLvVDsY3GTAdUom+At37ApS5AN4+wKdfIZQGuN+ppJJJ8HX5pQHaVZq0eCEnc697akhVjiTeju
	SBcgt1ujaDb03mAdu3inAn6G/YSqb4e5ze1BX+07jTZ5240gtJhbCh85TxyzTp1fjG3djDr/1Sh
	QaJPoHi0P8sJ/lZNAOZVCqo78eu/Mz0AC7mFObmj10tsPSIfIFAXkc/4LWkot87wiY8208MYtDY
	+SPLWx22UZFoG8876qMqxGVRqhT9Adk7q4MaE=
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867741cf.4.1774777959400;
        Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867571cf.4.1774777958955;
        Sun, 29 Mar 2026 02:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm8782231fa.42.2026.03.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:52:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:52:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add
 PMI632 Type-C property
Message-ID: <raecqyz4r7je5s6ecyclffwoi7kqt2oqwctj6aevj5tsfuxfkz@5i2jb5i62thx>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
 <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c8f667 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=4paqipjyf0t-I0uxfbgA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nehsxeu6R1yulIm8LjIsEzsumqzYv34M
X-Proofpoint-ORIG-GUID: nehsxeu6R1yulIm8LjIsEzsumqzYv34M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX1KT047LIhNCz
 IulQ5kffl6815y4xQ5G/MKrtrK1xEBazFyCG2FNE2gdx12GE6KT9gnaMN8LZ5/Ukq+RLzRttFb5
 og7mM5OBMi87j8eKP3qjj9BqHLO9fSrRXpqdah88To0d5TfU85IIu+v6S01NUwZ6TIZWfmrY7ep
 6IFhHuM/g1/ihIURG2bxoqg9ACnk3V5nS85aLbiL3s4WpL40Fbfa9w7cRamPZnBao3CVfo2PSmF
 +qTIyeWeUsU9S7ngquniPENVP2cUazjR16bkDgNcXGbk2RX3mlkd2SiVk2KCP5lgccbnAmKzcHE
 3ZLikuqfn2o4RjBwxnKsaAOooILkbxn8f0PWNIZ/HFQgrPwFzojWkq/spAPo+stt9Ql4Blf1rfW
 lW/aABl8+2OkDnVMS/fufc4oC+nWDmqjwYTmUrWQ0scoPbcFPs3n40TOMWOUA687i97/jK0+30z
 FyKQ6wxHig5pQZP10ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290075
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100590-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BCA6351751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 04:48:00AM +0000, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

