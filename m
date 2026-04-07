Return-Path: <linux-arm-msm+bounces-102136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPabDR7j1Gn0yQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48B3AD5E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30AFE300E5D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1913C3AB278;
	Tue,  7 Apr 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRY18Sgd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACHvREEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310E3AA4E7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559419; cv=none; b=RZcWQEgCjhzjFELhpWnx3KhJxGVnqrEtx8MyFps0CUBENIUhLcJZrTZowKnTn2TQyW+kVcPPFG+xzL/PbgNYH1mjHXcRSbhbXraAMl008ZPDob/5kxrtdeT1T/cAq5eZY7JPeEWsq+hY3F8lq1hfz58VuU6zr4GWpUmlRBRUW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559419; c=relaxed/simple;
	bh=5FZFpwbsvZkfWCGIHX89iA1PbcaMgbBVSQDDJ5l/Glg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKB95hm/qyV6VIAKZAzP4v1KzVnJJqCHF6H2vvrrRiKfbkOBd65K9LgQNlSrIQAKABzMBbakk1PR7+yNQEU3xJd6J3vyzvf0shs5gVvUTBsblRIr5qNM06QJlADgeZn05cTYTjC38yaaHG82t3ItfTQ10IxnEpP12ZdGUb+uLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRY18Sgd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACHvREEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ZLGT1584355
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6o+78GtA5SeBZnyBVOyCgJsy+RDbc81lZyqFwDAmIGg=; b=nRY18SgdId3HLTAp
	6dfTnPPIA8vS9qd20lg0qPf0MoGEqTj3EBuvAzrI4XnBYz0XjnG2eR1sV1FIwc2Y
	shE30s/qdRQDr53UN75hIpWzjRYQKtTgK14NwrLj5ZwdWOX6LnEQqGOb6Q30rpzB
	qlplYezgSZ/EmrPoTNw94a7NSeLydHn0FhjezIpokQQEjtUiLVo9xv1v3PRVUG2i
	izA4KUUVswDIQgQa1EbQ7nhf5yD1wN7lemQ0Vq85kwxnXCH9QrbfL21k41zqadn4
	uYD8jjqQoWPZDnCCWLBqI/BoYfO6o0Y1b0jZiU7jVBaURJOSIfWkGT35xeqz6wUs
	eTra3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tcrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:56:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d87632952so7506801cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559416; x=1776164216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6o+78GtA5SeBZnyBVOyCgJsy+RDbc81lZyqFwDAmIGg=;
        b=ACHvREEB21QnsDeIG09x5g2+yLkmsIawdzxmgTfrNFwt+awlypJmhkA78hVXpKe9Y4
         o7RwwuyjUHsexmRATMf824RanNbb4Qi5As+jTpfPimKi6BgiDLBCAPKKWeUKb13nGh51
         GF7s/QguyIoGEvLtFwiUr0sSjIslNoQ5E2zlulrby0IE/DsT9+vHNB6/4ZMTITIuum6j
         EuwOncqNswDzao/NvNdnSWGQxH4GxScyPzGj2cdhqR+ok2NUCot2p9AAhJCTobtqTwtI
         IJbqStNn4/hFg9ePkhAjMscRq5DaaawpSQ2+j3NcIvp1z6ctkvUkcj5XPNMovkH3WFGS
         N4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559416; x=1776164216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o+78GtA5SeBZnyBVOyCgJsy+RDbc81lZyqFwDAmIGg=;
        b=JgtDFE49ruMBEfG0nIIWKhHk0hJxGdHUSi6lRg5AWeWY5pPjjRl05+k8Hmy9W51sF8
         7Aj8Pjm+bHQYHV4dKDzywfbb+8hDrUXOAKCm89Wa5zBR6YsRjlQ378+5BPcAkukdIERn
         9a/F6OnPyDkGgHSQMqKiwr/d+sVN/4oJ9VGeR8nOf+DleKWYcPEiOTrhFw46RE51b80u
         TL3ryam6DtWf1EdTuRzV6u2yGhxid0C0rbOMw5XbdfbIJtdQsoBQ6PlBftAdC3hUjm2l
         KjmOCML/cKzFnA7aed5smhuTY9cyp8GLi+saLz5K5cr4dfTtWFCl4tEyOfBJlrhIXe2m
         AtyA==
X-Forwarded-Encrypted: i=1; AJvYcCWgN+Wfe8PQyjvjFV1XKnrMgeFz1on8Nld/Iy9miM//mQw0z/PlJLRqRpDR2Zq6wglAsKRohGslT5ZDODMC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LwCHCNtY+evLbhs9cyT9V+uqTSIHD0q9o18Peq1VxaejhJyK
	uDXlYkKqwdVluGbqtai5Z8mP53AYcLiz7xxIzShry37SHFymz7qKq06sMlk+BhWY7YR3Bw8PKoR
	r27QvJdh7xYMkGnR0Il2sC4RxdWdxKBkasCtJDDYdRc3/EG/NXGM6x2QOTKDTBci1fK3W
X-Gm-Gg: AeBDietl4uwuVbQWKVeHGuCpqT2Egaw1BIBNkM66Fy9jkoRisYLq9izp7h5F4NR8BjH
	JrVNwSpgsuTiovqFpYhOKzELVqxLSmyqw1eR6xijEBAeimZ1jCfrA/lin+BoyareFG4rXlG33cw
	sttfUGERivqVSN3V34o/qqQT6xlQ9020zWvDjjxeYj1A//L5KBZkUAkP3iXoH0FKhT/NOdc/FVo
	xcidE+xT0RC0PXzyNrZ5yZ4EDHj8LVxTVqldgpRBPV1PGbH2zIS4kfR9/Yqt6KJvLN+qHR96Y1s
	Qg+0f+O5NfLsFakgNRNm9IfgAvOLoWp7BJh68UHNWZ+NqmaSeKFFzG5y+nUhusiHOu8nHp4Qj5l
	CyerlbgmPFgjAmWdXVJaEsdtsz0Zg64q2zlTN/u1oSe8g8n2ggZAxzSneptQFrzQBoq5gIdTQnT
	D3OrE=
X-Received: by 2002:ac8:584c:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50d62af94f2mr177225691cf.2.1775559416035;
        Tue, 07 Apr 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50d62af94f2mr177225461cf.2.1775559415594;
        Tue, 07 Apr 2026 03:56:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff1c3dsm540271466b.49.2026.04.07.03.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:56:54 -0700 (PDT)
Message-ID: <22afd2ae-c5ef-421c-9a9c-dc1073aaaff4@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:56:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: gxclkctl: Use custom disable callback for
 gx_gdsc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-2-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-2-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e2f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4w9pqFYAhlswuzcMsVcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX4oXIGCwn5hQQ
 FsSpvQwRWvO4R+MxhSkTxXV3LCw6hidyCrAC/k4zU2LK3R1Zs0vqHcGti1IqCdxOpj56ffeecod
 kLil1so0Thm6fAaKzKIcdCZ/XBUQQRqui0kFdLS9kL3Dtf5MErTOyIV/zfwNU+9qkJNdB1jxnA0
 9r2hKSiYeGj6OWAKCPOG8P1wPwcNi5Qih2YlsixsSlUdFLYKGttOSU2fsJjM1yjL9XjEwrtz9aE
 dHDkhlgKWUxaBBF2UcSwgXETFfr5SInWI+hRHwtQEB+nF0EfZgbMzdioejViYDPBh1XrRbJUFbv
 JAEXSuEMX8dAhQvsV94u0cb9adglPXEn1zrgxP7SKbCPj07syiZnDYhHz+7zKhW1JgXAXUwsBKf
 ywEME8Sjdn/1u1CmJBzs8r6uFEOqDCZyrKKWt1CH98wchr831MmE06eRxJjbHBwepGE574iG4wo
 5qz91Sb7bhyqBDZkVqw==
X-Proofpoint-GUID: 85sXTTS-rwP1GEmw601NYdV6FMS64LBE
X-Proofpoint-ORIG-GUID: 85sXTTS-rwP1GEmw601NYdV6FMS64LBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,gmail.com,pm.me];
	TAGGED_FROM(0.00)[bounces-102136-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F48B3AD5E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:30 AM, Taniya Das wrote:
> The GX GDSC represents a special GPU power domain that must not be
> disabled during normal runtime PM flows. As per the GMU architecture,
> GX GDSC should only be force-disabled during GMU/GPU recovery, where the
> OS explicitly resets the GX power domain.
> 
> However, when managed by the generic GDSC runtime PM path, GX GDSC may be
> disabled during GMU runtime suspend, resulting in warnings such as:
> 
>   gx_clkctl_gx_gdsc status stuck at 'on'
> 
> and failures in gdsc_toggle_logic() during rpm suspend.
> 
> Use the newly added custom disable callback for gx_gdsc to ensure the
> GDSC is toggled only in recovery scenarios, while preventing unintended
> disable attempts during normal GMU runtime PM operations.
> 
> Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
> Closes: https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com/
> Reported-by: Alexander Koskovich <akoskovich@pm.me>
> Closes: https://lore.kernel.org/all/gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me/
> Fixes: 5af11acae660 ("clk: qcom: Add a driver for SM8750 GPU clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

