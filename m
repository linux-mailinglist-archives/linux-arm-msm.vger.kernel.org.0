Return-Path: <linux-arm-msm+bounces-99612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEoxFkdqwmlScwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:41:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E130695F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E051303146E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1597237F72A;
	Tue, 24 Mar 2026 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O21yC/i4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+ohYzmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25F370D75
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348686; cv=none; b=hVMgfIWd8o9vzRjXGkN1OxVPDOArv7QeR3l5yBJOKXq1EiOKUDMRRZMDw+jD3QkSCdHJRsEa7wcpqrIkJnYN12+dM4f6m6r0I4Bey/0terxi/hmLdWsMC/eVwyyuUJLzi5YscePYQ7nGMgU59krSAQQheOa+gzUxP360ZUU9LiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348686; c=relaxed/simple;
	bh=4nTSkJ8Z5UP9+k9ovEKnp9OOrytj8jQs5RhK5L4WIcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lO/N2HmabS1kXLFBRGo2U2CgQmpktfiCZ28TIEJmyPNGxoo6PA9Nwa5m6oZceKMtG0iFc7O7brvbt3Wn6KjYcjPxDziIAQ3DIGFquN6TWOXx6qDa/9pZvLa6fIixinh/DuZRNqj5ZLpUg/ze4dod+oBcEHrv0Y/eDmVSOdxg5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O21yC/i4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+ohYzmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OACJjJ1762131
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJrGXDFrbMcwpgod7t4kbx8Wp/kOz6YdHGYxpUusIJo=; b=O21yC/i4zNbFbVtI
	xYRM2lP4HpI/UT+wyLt/2RV5Fa/rchBDfSWFTGNqg1AfP97Ef6y/RCZIw8CbCHHm
	cLXEVAaqFop3lnrR0h6IG+k7sTE0epUkp+c5BflAwlvn/rPDzJ5FkuL+vhK61GZc
	oGjJZZYCSDzcRrcuuof8TAqAbxo0gD5By3F4d7NkFvVyXJp9DA99JFNcLmP5hyzN
	8FxMj+I9h/NwjzXpQ9Fa5dc1pDUbxdD6v/TXXiyRBUeJMzhrk7RFVM7aRLdSrd4k
	WVMOseoFhyi3pSQ6YQRW2UeuKYCdXDSTjgOTuN6HK0ZlIt+8X4Ont8lRf+Eb15nZ
	F2tEag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0c2ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:38:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b93be1227so4525460a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348682; x=1774953482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJrGXDFrbMcwpgod7t4kbx8Wp/kOz6YdHGYxpUusIJo=;
        b=K+ohYzmvSvpxt3m+ONgXLOMK5pTxrX7uHpERIMeO2PlQSxM22q8yToXVLwo3hxgpwz
         RaAcAlZ+sD1RjZCllVbzxfQKiPTU4fz6OrJBWJMSONUEalJyon/bQl0vmkb2VOH007Mz
         TY5GgOvKGPF+/JrSwgs7A43LTdqZ94KcLjnVaCTrORnb3RgVkvcgfYJ5YWAOFE5e28i7
         31hLNsUbsOecus2xAlWoXjTj4FKDMr6Q13pM6hQVhr0AZaCF3AY+zEz8HX+4cLEx1oes
         OqZFV/Cd+eX2BabfCnsS5maFFkZp0nHzlt82QRtLL/DnmY0f4YU+tIBKwSKt7mPDWAi8
         ohUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348682; x=1774953482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJrGXDFrbMcwpgod7t4kbx8Wp/kOz6YdHGYxpUusIJo=;
        b=drkVHcWTOx4K7Ebw+DQC3Zrf7e30fEDiQV7IFYEU20vaYSzLq8Lp5bt6n1Vr+Wnt9Q
         QceHoLvghU0W9DHgX+vKf1TQkCDi83ykARb1as5MEHI050PMoD6NP5vWSaa+KMJ7UZJN
         vm4swxBQps/qFL3TnxMn/3lcTaQ+4Y6kXVGg37IR0cz/xgcEv0LAu3Gy/ZUsB2iClGdr
         N2+0Kdk2KU9UTFXsSSEqOLqYmZLslQ77gw2ZpXvGHRgXRokeYPeKRFjUMJJyaNsL08Oq
         IZACDt7bR4/M21FyFpDdQ9xN6zj22a7t4X5TRe9PcGdAH9k2B7tsdwywg7MCGNtXsp7o
         DdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvEjoyNcA4nHJTIbCyGefPoB/0wDonUf4VUixRsSLUbGt6bnpk/l5Y+Enf108MK/49++14Q7V1u/rSVsdY@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqjvtkAJB+Leui9j2zP0aJwBhJjxvIg0wfoQt8Uj5zqf5kXgo
	Edb+hFYbYCDXabYDn8WjWthzmBBh8kn5ck09/MAnKTIBpULEkbLjRq/Uu4hZOHUzI0oaOP7t8Bp
	q/I+hOIxYvRTDWkBxAZdxaigoXtbCvfPL0QLGGd4mLf+B8EVNp3+ophFC1XlK/UFptJqA
X-Gm-Gg: ATEYQzxHQYJyTUe2JftWm3qsWdFzHhpfSM7E839TddRCRuiMGpukTrQBFhHK+XzhIQl
	nOCJjxiFKOIjHw+zL31SSnJ3LR+I+HQNjGMuTYFgZ3Wf74d0Q/tTDbJ8+rUHcB4JHFTUBuZlW2r
	fRATIodEHPG/gwUVnNu4ZbWf8d4sdT2SBJj9dp3EeJrV5aSIDF4KfCspKMmfqQGlG6lHrKqMES5
	zp8GF9PeM5pcJLEq8TFHCsKzGndSt6n8Q34xgGc2v5xqUNKoCXPzy5nSguf5nZ4LJ2Lr1+rQeb2
	ne1ev8LBo2jNhCtsxI/6G01+Ina0VFIrzRpFl9cl+0/fmlzh70dcSVRyKM+hhjJmGwdLuUnTb+s
	BLHuW5VGpdnvUt7EHaNUcGUnPbpFnwuwFOh4xx5I8aqG7NOxhYJ93
X-Received: by 2002:a17:90b:3943:b0:35b:a760:1a54 with SMTP id 98e67ed59e1d1-35bd2cdae76mr12688965a91.18.1774348681440;
        Tue, 24 Mar 2026 03:38:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3943:b0:35b:a760:1a54 with SMTP id 98e67ed59e1d1-35bd2cdae76mr12688928a91.18.1774348680916;
        Tue, 24 Mar 2026 03:38:00 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm2468107a91.3.2026.03.24.03.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:38:00 -0700 (PDT)
Message-ID: <546967f9-05f7-49ae-bfa9-204533715eb3@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:07:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: kodiak: Add power-domain and
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
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-7-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-7-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c2698a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UiMJoSEGjzb0WHtjmtMzje5uEyQuVfZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfX1MrBdBmdtFET
 UeD99xSouT/SpD/U8iwHqO0plVPB+lhlehuOCkztERqExZQPM/2imS1pDc5RGWdqkNeJadSuLyV
 BE3r3isajOs+tApsHyYgo/5/kiEhvzzhtvCbE0kvDllA39ClpBOzZpi4iNEq+oWrtXJSkv+xDar
 0gvQQe4Ozeg6cP9LKia/0lIF0ZGDM6nH3SOmHWcfx0CLiFonGsERf0Z+2aPPeCGiJVE5qakFWH5
 Cdi1Wer+cIGclKN+KuVzEfqV+W63tVGkvSWyr+Hvb6tB2sOzW9Q4ovwIgHzr2cZ6TAg7xAoMT5z
 whh6dHXpy/sJpsOqjL6XYWKL4fBBSxu8vaOdIuvR9QZne47IkvN/XG9W2yl4RqZ6/XkYvpTyfWE
 ZxNNimqGegZfuws7QCgfKWZV7Jlvhm7BIeewsVU8/E6SFYyoWT5yuhZxMtwvRhBPrlyiXIma728
 0e07RVeOdb+vd9d3Xcw==
X-Proofpoint-GUID: UiMJoSEGjzb0WHtjmtMzje5uEyQuVfZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99612-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A3E130695F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> kodiak.
> 
> Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested on qcm6490-idp and ice ufs probe works fine.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


