Return-Path: <linux-arm-msm+bounces-102147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULcdOtXp1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:26:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F33ADA91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35174300CC82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9883AC0FA;
	Tue,  7 Apr 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk9SYJLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3tWMBiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BE3A3E95
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561170; cv=none; b=D3YW/WY57aT+/QI/XNCcbIbfQQMz37p9J8AWlI8qMQ2wo2/bRmh64jSeSDPmedQnZEha34UPO0C/t34B6p04CYHYKaS+Tu/nXTRMhs2IolRncS6BDNzBDoNckEU3ZxSibeyOclBb8ynTWDc8sUd6sC2Pi6KyZXrDTa//PSx74oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561170; c=relaxed/simple;
	bh=uJpcUXZ8ngfDc651XDihmek7Ivq6mNlCdauDUPw7X/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9mMusC2TKue3rVVHY6rZT+w+o1Jj6OZwAy3n4wMj9idRzD5Qmya5/1bToWYw91aMl+jJy1e00FWfpAkq887jJxyp8FCBis4sp8Muyx4eU43onkcuLjHEyxDRVGAttIZLs4ebwzRlnoPfj1EoG/ZabVHOHezu3nBpcMCu4Um41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk9SYJLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3tWMBiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376hNYe2580434
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=; b=Qk9SYJLPmcSiobdx
	DDdpEomgeGQBmOYkdDskTWYut20jMe+eqh/qNYcj+pTIC5UneXAFr0sPG7HCzJRS
	fwRTUueOrhZDTq/96dNT0cUYQfYtI1qCnyeKPysuuj7qH/Znyy/J6KiuZk3pvSD/
	B0iwKlvIHB+tQWGKJFBxAn8TUJ/8RMWT5v7Bm7F84xyS4p86AMbIdol7WNPQ1SEN
	QqCzEKA6nb3lcPlo/JcgYxKIYtQmIo5cg+7WYd5sc8d6q8zqFnSOV4xnSJh3e5Ce
	2ammEG1tXFAd9wKJqTR+n6yxnnGVduTRaDR6QhDsjtLu1+yXPyRa+PXQsdust7nx
	M9Mx5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2g0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:26:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso18171041cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561167; x=1776165967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=;
        b=g3tWMBiych7PWlu0TpBtvGN1vJdez1NvP+mZupX6DnNkJl/RPY+Rn5Q5HFzJVhI087
         IA3yg2A+fGBPiZyE9MrKuZJ85if5TTawB1CjPpQLD+eZWb73wYUFoCu6yATPe1vNV4lH
         B3usD3hXc4JwQhJl0p+ZsdrzlX5lhLyraB4WK3Nj3nslDxpQwTzc2t1oCnZwyrY1pygM
         zANLbJpvJBre8BYaMZlbngFANebe9toHPFpr3vKX0rHVpX4FkVO18IZrbEUP74CDzGsf
         MJ0nGeRHS9RHwW8XAhJcckZMubkdT1gTSqm/eza1443qiPq/ZgL/arvW3CstSea9LRwE
         Np+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561167; x=1776165967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=;
        b=IW4iM+m7vXbVFqs8IShqGXD6pt6jWRRanYedX14QD1g+7FpnIyxyhv1I19l7rbukFS
         HYxEgHk0aYxi3CKkrYr4Hj3fJ0k45TB4jWTJiIhjFr3JkfQ4twgtrAGfeIqDH/gZCVmJ
         iMvRuvs3sNNC6p56mVrjskfGoklYQ1YUSg/plznowfY52Mqbkr2Sqdii6mUYSN6daKop
         HEB5pNX9AlwxuYbZl1KlRuAMo043uCg3KJFoOUAmhRWr1pXWM9WHIEnlOOfhzMJIaYso
         SjqrTLb3HJ3ULprfkbdFc9YcQCLtfbCwhrvEQHasXV0aF9PTjk9u6D7+ZxwlurC8Gcyy
         KkHg==
X-Forwarded-Encrypted: i=1; AJvYcCULh3UYHIwRc/2Yh2+APDP08CXeDrho2Cec0XbeTrrUSfKUVJTvfa01FDBuRRkNAWh9ObVvNdMgLSB42nrg@vger.kernel.org
X-Gm-Message-State: AOJu0YyfEBTGc0PyzJJbx1hY8qp0/WaC1savGEowWoEFlDmQZ1ujq7X1
	neRLNFmSL29Z/6Enz/8/yQYHQSnrzkMz7QefrMi9rfmi20MEkjf/DeZ8TT3at743f/nH/CbEhrd
	8/wDUE0G7cNUDqautWrrPnZVXkynLIX4fwWFwA0w8oHb9asYPU+w+vzkoWppUTu1uEJSl
X-Gm-Gg: AeBDieuzUt+at/BxTmHJKgSvAytrI8tK8q1T0pLSPp/nuDUO/wllfVsiiOQ16KDyZSD
	f88t+Ka3hpso7LB0wOtj5iorNUdUInVOsOUR8GYNFNUPfc4sxwqMloMEiCNgaJiMeDrjR4P3tZl
	rQ0pmtvMkkaDKJBwjzcMmUR+NpM0VfzBjZbNpvxoNCYrwZWEIVS/NyZVFiyUzLDbUwktk1CbHaN
	GJvYWan2fMPupoCP9dPUTSj9cQuBrbnpW6JHUuLpiPE/tpg+Rt8Lb6XjGEJAqtSIMyYJq0vo/7T
	g2azaGqUqYDFJs+TfyygNz6YxJYQon2cg3P0rRpYP4ZoiRkMjJ515kmOKN1tXF5Y++Grqc+wSqr
	vJXSqRa4K3bfG9S9LOf0LEyjxZwqzvHvdKLu0G3PAvYv7eu5D5zhDDksf183cm+i/ExsbS2zfwZ
	baxu8=
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr190561116d6.1.1775561167337;
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr190560776d6.1.1775561166945;
        Tue, 07 Apr 2026 04:26:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm558375166b.30.2026.04.07.04.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:26:06 -0700 (PDT)
Message-ID: <11b683e6-aca6-42d2-8993-b9aae39ae44b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:26:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable
 mdss1 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
 <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfXxtZifDuittP4
 nbCcx8BKWqvA2jIKtGBXdh/CprGaLRTp5DQBew+s/Yq1/Z7FwL0dNPKadaIugpu3FSaCX2G1ivd
 bV5AT3RC7d4BM8jTIY9VYHdXrEmV6H49SdGokVGBKPKq33MoXgRZvrwdOmGNFVPdXUl3Y77YZLo
 Sr4B19fuljF7DrW5ZqH7BX6wcEnMT8YSzUZnSp+MWrFOHifiwq1oaa2Lm7MlCyQ+gh1quO4ceF9
 9/giI9VcHFRYaHiHk13bbWpIQ+dnLtBoJ3Q4OjmaOxd0MYDWdolgC3VOxr8Uc1TT9SnW4YUtYlK
 iCmoE0cjWVR8i7D4EwDqOcuh7ziRt24DqUI9/wmW5SxgfkQpKl9qzBtsKXMSlTffaLJQbps1aDq
 +/g/mwzX9+aQZKREs5Af8P6AWtMUdpChAsep+5OZTn/hHw6QUZpHErg6RxT8qOEN1TkjGYiGnyG
 EkltcRaDmYDWzghKcEw==
X-Proofpoint-ORIG-GUID: bmudMxUAFoK1dqirT8d2_Wz1VLkbryfW
X-Proofpoint-GUID: bmudMxUAFoK1dqirT8d2_Wz1VLkbryfW
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4e9cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fOsgxGAhkaL6H6YktGQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070107
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102147-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
X-Rspamd-Queue-Id: 684F33ADA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 11:50 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> Enable DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to eDP2
> and eDP3.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

