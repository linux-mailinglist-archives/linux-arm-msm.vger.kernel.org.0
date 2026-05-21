Return-Path: <linux-arm-msm+bounces-108980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH9DOo/NDmpoCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:17:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD045A2188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B34AD317198E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A9B36606A;
	Thu, 21 May 2026 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsz/q4AN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAxh2SOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982336682A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353898; cv=none; b=dMpBaDyloakY7+qkU9MtcCTYTOXoc30OnM+fmdoXLamIjp4u//tU3UFGYuWwkvth7oIVWhNduKnWNpSMkgKEJrmbybNjluQTF7nOV7zcF3mFrnNQe6pagXL3FZT41/qMGswdsqHU1AtLmj/CS1Zke3pn7bp5/z8A7VWJyzj98gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353898; c=relaxed/simple;
	bh=lslQASFEUm7f5EbxnavPnTO1MWlZb7ZZGbrNAKvDEck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4Mn2unXgC3NrStA+oR6tCnjgsUO0/XZIN08nJbFKdumbcxh5+KnkUot/rnRdLEn34+HAo/hcFY34pJsLgFvu+fDWtp2D8+VjjfxXceWyGH6DoBBJW9y9lincwuSJWK3jKuivz2ffjgTUM+YdhSylPiTVNVOepGIUKBJDKX17SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsz/q4AN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAxh2SOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L68pFv3110731
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/2fOEMVVPBZxITj1fKdOBooT5LNiEmv9iLF1eTMvuY=; b=jsz/q4ANigv0XvdY
	qbhjewZxHqEZgr0dqU+bgP33Sj2R0wl8IQJoXiE821UhoR8gS2+b2NRp+WGDvHp1
	R141VBHLn3FOYZPL+n5VLElstgIiPWmT/8Tj6PviF/ffOZBiJU3WqB3gXGjohupZ
	B8sIEEAFRkrRhXeF4rT94iAG2oTZV/197FnNZqSbcTqC3e1+4jvV8xfgR6lfEnyJ
	6MafDfhqBwR/G6xzIy5JQIuGRLEzosFo+bKzQ+XNd6BpVgnlNrHfwhAi5zJSh1IM
	4IZMcQ17UU5JniBdKF3pc7GezNM2h3DC2roqdLjT/7kLoDcaT1rMdLHe+okAncMw
	T5QXuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbgpha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:58:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e576143baso16600251cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353896; x=1779958696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/2fOEMVVPBZxITj1fKdOBooT5LNiEmv9iLF1eTMvuY=;
        b=kAxh2SOlMysuCg26/E62mYyBkE67M2IwiES2uOjAwp8gXHsU2mS+zc711AGTIZp4t/
         GEfm+0jsG4DSosGdnzwMwZGyyGlGhJxP916OA4Dcmrlt650LdVpA3ZPlNtVQq+4Zj4Ed
         udfAlKT9Zg8zciO26lvc+0FKhSs9Q++MBHwlATqBkVXGdJXTUqKat/vUGELPxQ9Z6EuX
         9gdYVsDRQqdq2GmR2RysMouRyYULus0aaZ+coaYwzUjsaY8e6rXte0S92Zba4qR3O+sP
         ND1UFQYinmCgU1tp81GPlLJDBmdpscaB5ejyBKps07tbie2lokjtNv+x66d/aS73yuHc
         waAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353896; x=1779958696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/2fOEMVVPBZxITj1fKdOBooT5LNiEmv9iLF1eTMvuY=;
        b=UqRMkC3A7DFBiiwwqUFFJVBCiLtOotz3hE53RRpcBrREXkJPUjxlCuRcUEcP2rFGpd
         HA0hJ03fdd5SfqBSLLmAU4KpclgVwHAjMYwDR9HWp/ucAIrgNQ7Hvph13iYWLYs2ExK2
         VeL1GtvENccBfX5H4/d0264uSoBKNd3Jxp/rGfBEM9oTbOxvEB5G2Fg88yxQLOsrHndV
         UgevreycyoCgKV1xIQnIcpMuQLCQ8vMu+MOILOVjxKe4KY7Q63cA+8u9fdUzWd4m4Yzv
         0nBxCACCdqXradTy+VUi6iVHgAbzuredsmM8kV0caK6L6C+Skt5PJn6KUAHwjKUdv0dh
         l3Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/KAd3WVobyWdCMUi0eOFVOXMgaB+I3Eeyc9rD3VvU4XjUW/G6FAHYLJdo22zGg0c7GX6aOqGnnwV+SQ/OS@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpoGiZBpTbUYVOW3iiZOpz3sDFffhPc5FAsQWbLk0RMKrobE1
	llIu4fBK1TCDiiYmrRyfnrPbx+AhRQ0II0FRdY/EoNClhFJJoIqtMB3bDeiDTTrVbiJpMraPo3A
	lgeKqselUjBJz3swzuoVgevNBmFZP3dGMjnuzP3pNznqhqRa8Fl13W2U+dx4156UX9j9B
X-Gm-Gg: Acq92OFbanzlkg4XB2GWL9PN26T552laOLGrBB2y8lgJX9Z/o9UqudFT6BvLHFho7WQ
	JSf+koZ0Zj21ZgCtSWkAgJv1VAbb2NQmiua0vIwRUrcgGHeZzzbas0YpDSHC9sTXGfL1ZLrVV6R
	vkkJr9gfI4MwmWjrxU3NaPpYaswaagqx66uFEveVqnZQAaO+bXtHkgTKGjS01yuJ8W8ALLTDyBR
	HMba5+Z64C2vz3LFuAOOus0QXruiV9LojAKQtSrcnZbdjb4CPa7fldY5bTwxsx3Ql2dgCKaQQhq
	TsV/KHxveyAzBX+FQM1lSC+6L0HmIkpJUlaLDpv0+qTVoCnFQKuBuURihHKdWXbR9bvGutTZjjE
	CNVUePgaeBLEveiY6ROgNm4MK6rymU1/6Z5KLLQ/nGgs3tITDmzCe8z17693qyLMlSy6/djf5or
	xhI/+3LlEEXkbK+Q==
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17459461cf.1.1779353895827;
        Thu, 21 May 2026 01:58:15 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17459281cf.1.1779353895437;
        Thu, 21 May 2026 01:58:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187ecb7sm8674536a12.29.2026.05.21.01.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:58:14 -0700 (PDT)
Message-ID: <04d53467-a802-4221-87f3-95738136dc21@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate
 DMIC supplies
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-11-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-11-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfX6kDGyf//+fBS
 L+qahN/LIXKvP8bHB1InRWh4N8C8T+LMiADQ+An9MWi3w7vwDfUCMP7uS+zNjnucyF76P+G+FeH
 cGHsSUPcKZT8iX3M6LbBzpKqYfZoEjiECEbHQ4uR6dO6ZXbuIcWeeAPZG+hIVl2qka0n7pALsss
 sVgbaokgiun//6HpVBLr22l2LR/pT0c3+8n0xo87UqJpZXJKQCnKbCCOZgg/QFkRLFN10H8CE5u
 7yKyNMdkhyyLtmj0TNSWEcjmqCOjtldWUSgsaQudZHs+rvit5EbJ+RFIYZgage672dNEFJ5SPty
 6GLZ8sPTlc18qbsRe1vGKGzmSQvFWECqOEkHH361PtlE/P4MV8IskvpuWFXe4THyotUFHKTuQ+H
 3nB66DZrz8ReUCS1lYNbe6f+KxzUxSGeKXiX79oywXPTuD2wFdIMdSG2jq2QN1w+OMTUFatt433
 fvMRiNQgwUSrlwRqywA==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ec928 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IsynIjjgYZZsLSkCIH9xY-rKnOLT2BBQ
X-Proofpoint-ORIG-GUID: IsynIjjgYZZsLSkCIH9xY-rKnOLT2BBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108980-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 5DD045A2188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Align with the reference implementation from the ThinkPad X13s.
> 
> The audio-routing setup specifies two power supplies for each DMIC,
> but only one of them can be active at the same time.
> 
> Drop the redundant routes to the pull-up "VA MIC BIASn" supplies as
> done in commit a2e617f4e698 ("arm64: dts: qcom: sc8280xp-x13s: Drop
> duplicate DMIC supplies").
> 
> There is no functional difference except that we skip briefly switching
> to pull-up mode when shutting down the microphone.
> 
> Cc: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

