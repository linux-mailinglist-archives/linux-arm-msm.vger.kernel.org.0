Return-Path: <linux-arm-msm+bounces-93877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAFzF88jnWkcNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:06:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D10181908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40723061AF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7C423ABB9;
	Tue, 24 Feb 2026 04:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBrhp68H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drUFYfgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36224A07C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771905940; cv=none; b=s/prOz4oVOzz0Pq7PzLrbuU5iQ9YBCmRRM48GKxX0N8Pxxze6pSJq00P2HEKW5/wBAcXC+EhBpiuhiH1NxdXFVi6th/OsiN8g/DLuaQ/LjN7Q2x/rjJQpZiEQoyoLYnKgQ8MjdiQafPJGH+wn4tLSpbgUt3VWAKNW14cxvAlr2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771905940; c=relaxed/simple;
	bh=Gcs7YQRHfeJ1LDy6+oDSLDq1m3GmmKByWC2wHgmTPTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O99BZ8DKQYus8Cd6jDnhr7WBybhFHhrwRwhz8fN4SRC/4EZwLAQvggsju4zCQfStTu+Tt2BG+lnWBMc0gMXJ02mLM4Y4ePSg8bLAkzC77vFBKmHyP5Fjzd+26B41OdTct0Bdxc3EZxfzvAnwyMS4bWgyqCnuy6j3g7qVj26JpcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBrhp68H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drUFYfgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3o9M31395410
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UWPXJP1SNxi8mpOlT57+8AdR26SzUQH4u2S6/uF/zA=; b=fBrhp68H8KQSKefd
	NJVDYryHM/H67XJqiLs1JFQlWyfyGEogpPGeJ3hpUicxVKArFr9Sq8GuauqlUa+8
	fMiFKTPJi7xImQL+rBSdKiEfvr9r8fmISrSvxUo+A77O27YqFz/tfWNn1ocUODRw
	atPT4Rs0Mp3rZS+2kT+0LRb8HNUqVl+LeuPqh0iZBtfBYn3ln2fJTqKkpfX+57vN
	PrEu1vtwHaHFNPgfLe0aPOsuJiLmI/V9860rhgbF/e1D5V6SqM+UhYmeXWiWdBdk
	N0LVPYRBCiHaip4s1HtBbmfvr3hi02WcUX3r5wkcQFb04f0pkZ3h8toAOYO6ZHZz
	T73Pyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e3816g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b0d938dso5043101385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905937; x=1772510737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UWPXJP1SNxi8mpOlT57+8AdR26SzUQH4u2S6/uF/zA=;
        b=drUFYfgR6ddDLzGPjth3qcwKPOC+jIp2t8rGyOUpDTEUoJH0Bd3lOt+u5WaoweNB3i
         lf+LL/Ik1Ts6OyANHi9i60BT6gE07kLlNXwXkcA2kZu5zcKyJM48Xo52BF2QVg1jGRZG
         HtJVj1wAK96rTjnqMvgFEqEPDJUVgPyup+UvseIHZXXB/42Yc4Ijx69LJ2uSY3IXvfUA
         b96FeJsHLOMu6nVmZ90vVbMx3Y5TkwjaszmSqzZ3T03ZUgkxHuy1rBpowOS37srjYkTE
         E/UyDUe2QKdd/dKt8ikVvDPLXQbZtN8zTJcNajwyoPQO3GmpMFP2Sd5mgJG3Jkq91p7P
         FABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905937; x=1772510737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UWPXJP1SNxi8mpOlT57+8AdR26SzUQH4u2S6/uF/zA=;
        b=LNRiFvXJrRvwm9P8SfZpZ5aKcKMSuwkzmN/L6n1inmPqvTDTQ7A/JrnQvFIzvAiqDt
         EX1LB1KaO855f0S+kYPPQ/rHcZG0f01PrHmR1LaegTocJfEo/0tLy0Z8CGuWPKyx9E9B
         3J/j/8YJONtel00fHPOlNMhXdm/VbpGwTAl1/qaBnNc+EI19D4mVCuDxJCJ4XAGte/K9
         T7x1deD0kq+9gnJ26oZ7zo6UaO7+DAranWMWBStVkxcUOidWavsyWgp3CdXWRmUL9eeX
         YO5LlyxDUQue2Hs/aJUlscnIEAr1GpkcWS1/uUouw9K0SQXaD4N3QFJuNkWyVIrrRccB
         NpBw==
X-Gm-Message-State: AOJu0YwfGyaxuA7Ds8aS1ZwizfqjG3XB3SGFrQ4ZoDsQQ/hZ3nGew0my
	quCGr22RaFTvh72mkgArhDWouQBOv2/soqM0fJGXP25c5hxpmYaDzv4LZ9bYTL5tuXWDBsOoeIK
	k81lPQtOx+lq1YKs7HUGOJ7AQgWvyDyZcR0YOWdz7asL1STj9OMJhx4beltUWezZMuIaq
X-Gm-Gg: AZuq6aIU6mMVAT+nn195siHZmZDikEE4c9R3tXbeGzFf5ZjohXuK5GUy4oTC9a6JVLz
	8sxL/G5OoW4Hd/krID1FoADfl+KLtiQiY7A4GHM8rMhY4tkqLySEpDxAh81g+P5DpsC3xNynPFv
	gETLe84rLq9IkNLMDTg/wDOm0PkCYWaJxreGf+GAHZGZzT/M0TEzP3bEBqPbYyUtK/YmhGKg88B
	ACBCMG90BlNW5Fv2/2GJoFa2FI+WRkSYB+zkF3QagORAae6LTq3gKdGpz/XJw2Xe4tsWpRk56XD
	B7kebbsP6OTfdfYLTHmrxNI11A3poKotSK55iK4T1O2OWiezP1sJvCUWeaw6d/d2tk3CU02NK9M
	Z3zJEd00kWcctVEh2MDJbpd1SfWxZd7y/LBJaWk4VhMxH5yrmjUP7svSkE+WdmU/ftvWzkSdS0v
	/LeeQOE8RzNQITxYPgaqZWUJhsZy67F0Z3aYc=
X-Received: by 2002:a05:620a:2844:b0:8cb:3e7c:a4a4 with SMTP id af79cd13be357-8cb8ca67610mr1376726385a.46.1771905937323;
        Mon, 23 Feb 2026 20:05:37 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8cb:3e7c:a4a4 with SMTP id af79cd13be357-8cb8ca67610mr1376722285a.46.1771905936692;
        Mon, 23 Feb 2026 20:05:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:05:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Date: Tue, 24 Feb 2026 06:05:26 +0200
Message-ID: <177190591482.429979.15424065965109747590.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d2392 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=3kVz5KBeNGK-UBlMhTMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: NYuU3Z1bttxoTuVEUuu1GjuurL4DB5SN
X-Proofpoint-ORIG-GUID: NYuU3Z1bttxoTuVEUuu1GjuurL4DB5SN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX3D9DaSP0P77C
 ufIowMN9jganOrNCFv3rP46fX8vYcEt46z8lPI+gmw/9X0O69QuUDB2nuBGo7rLhkkKzAmCE+oe
 Mcp/FgHtVtFcYFZqZLvs2+YAD/yaoF7HnmT9/TXf2UVSrhUTshw+JBb/LrHIhE+B69HuagJ3fJq
 WYttu8aWxkDh0MX4srZGfCdKuoiiEBqci6zv9w57HvkpvBfQADuSoQtxx7NE9aR8ufN30yIjmDN
 B6bDDVNycc7maz+fIR2u27fj9ob/EqvI9TIQCUFl5+n5G9vQBqc6Q1ICQbQmC3UYAlyVM5P2T7x
 mKKs48iG0ak8bnAUTOcs5n6Dg9gHD768G3hGYSJ+Xx1c/SJ7z7HpN39YwPled3K5Ig/3plzEZcX
 TjY2DkhIQ2qg/P8ZLWizoamOS8bpD8Kp+6j1TpXuaOx7o7zGQSUBKVnO0yESXUcGbbRF4GtqrZN
 Q2jHV8znMwMUTUkXx7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93877-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6D10181908
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 11:58:49 +0100, Konrad Dybcio wrote:
> The register space has grown with what seems to be DPU8.
> Bump up the .len to match.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix LM size on a number of platforms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f7bf13197392

Best regards,
-- 
With best wishes
Dmitry



