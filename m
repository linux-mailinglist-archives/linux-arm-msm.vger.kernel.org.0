Return-Path: <linux-arm-msm+bounces-94878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AITFGq5upWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:04:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E11D7246
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54658303BB33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C8735FF57;
	Mon,  2 Mar 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyKMWc+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it/CCoPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D5532AABD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449353; cv=none; b=S6ctdb/MER3CeSHKCgayJgftVhb7RQrmXIEGtpjbomFnl7hYCzZCMDODGC+pKnpGJIapuapuX3A6fZMmJFvfgnEAA+ip1iQMIurKbtDjJdZrtGy7W1bza0BEBMrnjMwYZqvcpeg5sI8YjTRI+SbQWukDhqsA9A8+szVzwmE9HBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449353; c=relaxed/simple;
	bh=0X3Uk2Mouix3Us94zBjQOFerzLePodn5EI2IRVvCNIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM6WFDNwYrqQMgvW9Qq8AlsMo79yPf2yX0/64JHCSwXCXsZf10LVB9wL+3tya9rnXuXdO8+Jf+N+3bDn9Y/a0PiqlYrr1Fk4GeHKTE2GviigC2SXWE3kjkN5rNEgiOTa1pBKSjy4twWqzdFQWlVzpXW+oD9uWA9rg+LY7iWoxTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyKMWc+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it/CCoPF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227unXB2036244
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrD0+e5gZel+3U94lcHkfGnkgY2W80Bgk3xf+Y1/Kck=; b=RyKMWc+E4j5NIRM4
	HEZwyszG/T+2pgnQ7BFXanDC+bNdvvQrkRFt8v9QgpM6OrjKF5M/TMA6HPlpgPnC
	M+xjRDMGJu4M3m5N3D6/IlUK/TO7ofzg4kiCJi0LlhZtBhvyvOruPaupUYJV50rL
	HjCN1dpkQzrSlKhhsMaD1ddebh1++KnDs12AJ2kMCC2K3dgGZsG0RNTwlZyKC18t
	W+MXm1SyfY3ia5ib8mFKY5T1WKIJSVnvAX+7tO1zqiOhFGw8c8t5ZytXGfdNorHp
	XR6daooBGon0CsAN8EueovnfycIuvIbmqtOi/7RYd95br4wfBewHvt++xBh2b23p
	/bN32A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd59nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:02:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38a5dc3cso436647985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449346; x=1773054146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrD0+e5gZel+3U94lcHkfGnkgY2W80Bgk3xf+Y1/Kck=;
        b=it/CCoPF4Ox0OWP30V6o9KjKHNZc81gBp9AhUninqXriEnnjXAKARa0ugCgRwpcHI8
         UzJ9uTxOwt9rVRB+UEwRsvJ0dE5X99I8g94TZP1Q67/si4sTgKp735fxYLE/OyE5Ytp5
         MZtrQkEIsdtzVYI1VhdqrkHr2fpu2qHMpMMlrApVxNItIAQWo84YyTpQ1mYi5pgIRe5m
         SDfoBMtVdx5/rvJxzqOJjsnQmB/PnVXotRiDaEC+vM7r2wWqMPEk49KS/ZEKDsCE3llR
         lgFiHdtvyH7VGA7t473GyvCzrLQzkEUug9QlNkcWIxYAweIqRYGKbzCKksz0fOXr+e+W
         Glkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449346; x=1773054146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrD0+e5gZel+3U94lcHkfGnkgY2W80Bgk3xf+Y1/Kck=;
        b=X5uMwU7W5nanOUUbm7XTUkBCR7Gt8xBa2ZozzF9hEHqmeuRRBKL00Vbve8NNlISwu6
         G2mahkFuDaGb39rhW8+aIyXWPsQ57/YAhInFwcXqc8EQHaOF2p49FXnGBtrgmQvSt4RV
         G2UO84xyDVDYXpWBd51gpiXT9IPhcgyTYAQGbEYd9ISIVeANDszHSOyLWobihSVxbnpP
         WZ0rZFN+tq7AQEDGKMZWnXZ0Ixhs27gkJNQAgo+UvScNWLj8w7Ixh2wEI6EIFbaNU1PN
         iPaKUCzAjEWBuut5u5lxugHYVcmdmWeLXfAVGiEyAckBN/7e89r4jGmmuiL5Q3nvXcAO
         DZSQ==
X-Gm-Message-State: AOJu0Yzw/FI/hkRKKcmtC+16OQvI1EVpLW4cYNIWweYNZvOWbQ2DV5UZ
	2DcWghnmzND94NK5ho97nu+ebhrF2oqPzDQUPaalQlO+XDMGs49pklEQFJGKhSTwMUL3mNKX7Ug
	ruYtQZS0WhqtAc1gHnw+hb6P06WeE5zkOj64BEGTyz/F3U1c9bzf/keR/3GGCqeI1V0Ha
X-Gm-Gg: ATEYQzxVolHZHvMGn1GqqdbafOwQXCG90eL6eMy3OZBcUeXqNaKFCNZ4iD6sUubxynQ
	jlRXvpTjgisBBGfgFR89yQKIy/rh95z0YiZ91ii7tzlADALvPQi6KYh1cr4KeusGhRBd+znd0Sp
	8dfnI7BN6Lvddh768znC9lCh5nqVRllZ0ow0DV8o+BHiO7K+9N7JM2Lpdn60lmVlTFWcFcRB6KJ
	GKNPPi++wR2xBaG543HHmv47luQuy+UqIWzbVdmnjgOgE4zmSqU5ozk+w/NPVj8rs7aqclleK0i
	T6xm4mWzOUFCTBjrO20O0POktsErsHqGQ8gW4WdrGQJchskAGWUdEzi//m+PFdukiSob1feBKMr
	swkOALC4/up/PYKqUH/i4b7G4OGZ4xwuY2NDnFcHpQ6whHHFSFkmEC2pJXZ/70Q79pjvPve9kzr
	ixmRg=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1104213485a.9.1772449346370;
        Mon, 02 Mar 2026 03:02:26 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1104210385a.9.1772449345842;
        Mon, 02 Mar 2026 03:02:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06dc16sm3314925a12.23.2026.03.02.03.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:02:25 -0800 (PST)
Message-ID: <4489ff9c-a3aa-43e9-92b3-d1a52fdef92d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:02:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
        White Lewis <liu224806@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-5-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228141715.35307-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8m0DU6Nsz6Hc-vgVy3q7tKwyUcYT0kiD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfX92wAglVl9zh5
 K/Eq2Wp++KLVtPOumhRll66lAoJuh6rj5cKA02UMz3j/0bjk3VQjL+ong64y9GeewaqapYvt2mr
 CqzicU3UXPRgnSiTkGuQjNRGvMh2q0kXoEAbV49RVZSMhiQ/6oJ0I2OvAzWGbi9DgRPk7DDZuiB
 QRnyiHwczQ69ArWzKnRz49evhx8aCRKgOntBZA0M8+1o0NXJuuqMos/J6WzznVz3FgiAQnWM17P
 vG5FXxdTZijJSple02mDIayesBulQIcJ4cuBQcwHyd+xmb85F/JmIJ9l1t6XEML+V5fb1qMq+pN
 DC9OzsKUPG21uM0pBRoz11nULmr7Dw+jIHxg85Dm9nL4HaKirX7IPwEb4CLeUQb+KdTFnYYQdaB
 7hxD3bCFa66ScEB4TXpme19YHcdU2IGPSJT155CfT/IZ5QQ8tP+FjRWgLzr1fBShA2XD3ctIDLi
 GL+FkMjDJC6PikT2BIA==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a56e43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-LkXMzDxGcKDj-WG6ZYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8m0DU6Nsz6Hc-vgVy3q7tKwyUcYT0kiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020091
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
	TAGGED_FROM(0.00)[bounces-94878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E69E11D7246
X-Rspamd-Action: no action

On 2/28/26 3:17 PM, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

