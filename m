Return-Path: <linux-arm-msm+bounces-96593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCklA0n0r2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:36:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D33249776
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57F40305CA1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBDE36F412;
	Tue, 10 Mar 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYHXCAYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0Dp+68x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDF370D4F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138994; cv=none; b=iukiDTo/E5K9PflXu48EJoOw+iWWHFudl1DD0MzJoO+bJ1MDwmTZQNSP7Ev5NGusA2rStRUSr9XBm9Q/pwCn7k/Uq9wN09xwnXH4PTGtWNSa7Bb0PetCOLgmEbhmgz+E7zlc2Od+uWmlf12idTiQkMTLODhoLj0u1A36wEFoqJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138994; c=relaxed/simple;
	bh=5gPUc+ReZ6qTYu7jb5bZeSyiHhNiGzrTTNowU76wE+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+l5VDL3/Lr027IlwTGTGQs0Zn6Y9rdqEx5M1wFHK25z/T6gGl63pWRIJWyYxhx1J/FQWl5qVT2j063tpYnCvGXQwxGqw2tkqNbofhaLlt/9Yj0nSOB27GJL2989k7Xyk1VD3F0vhO3ww1ZyK8okC0o0p43xmEDOQ4L+7b8suVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYHXCAYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0Dp+68x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h4Pc2754089
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ec6eXrocN5r99z8UdbN39kTGog2RVtn0dkLGm0Fq7qs=; b=fYHXCAYQv0nvDvat
	jDswVYS3SfN8BravcOcX7YrZxwxjNYz2V2rA17//1eCgMDzv/VrNTzAQmpa7yLbb
	xix3zrgKB5V/hXyHdHbmonCLT5UmfqfzZf4lveb73zljVfUuxsWiclMrziZTD2oI
	S1/9m/RwtastuXLqc4VxJ8PfU0E9om2GKTbalgXIFglBF4BmDqfJd375YYBplXvl
	dbznzj/E1fX0ZZMj2UjNvsCjpugOK/rOZll9IjXO86IEh5liszvijq2twwBUFNFA
	rjNjKty9ivp0rwC1/gZxP3rusemYlgwTeKPDtc2QT7TluWoy3U4UDVMD8SY1joB2
	MYlc/A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrdtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:36:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so162147137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773138991; x=1773743791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ec6eXrocN5r99z8UdbN39kTGog2RVtn0dkLGm0Fq7qs=;
        b=U0Dp+68x7Dbyp5GqX9o198opfFmasiTC/ss9gJt3etyqamE63FffI4FJgSsrtHnHKd
         0IjAiLLeXGObujFZHaM2j5VFpYEkksFMJBXUKF+ti96jPm0EZODuwYOSn6ytutj/UOa6
         E3zgc8LIutZv+k3vPxQiH35jliwLgfIsDpz35EkI3T3Ss1nfWVQOjpeKOjgpiGdIr2g/
         waP30kibs8AtGB2U7mkQDPfvdhLUwK3k/cxnkFmPnK3j1BYhGpvSPxNeYacuiinsgebf
         k+SnCiJJwKGFFXTExkoo+puhGT2Oyf8/HqxD2j00B89kJoi6b9/3u4lb36C/DJAm2Utt
         JKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138991; x=1773743791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec6eXrocN5r99z8UdbN39kTGog2RVtn0dkLGm0Fq7qs=;
        b=mNBRxiqMZaSlEPg74Q0eQmotBBz7fJt12cd0qSO3FowVqRfgUtmIcXR8cEr6Nb9D1L
         knX8PFkuNChKLuRR1s+sz6lFjpy6cIor/DjopiPFGr4uJlArMxmAUN71GHudOSAY2Mu4
         LZ4BcTAS+HwM49GVmz/LhvN1cR0AQbBsyd4ZNceeZpAjZJNUm841SrcUzYqrfvhGoENk
         jMq8Zq4wSuOe4jz0MEuvhE2HtpwpAdoyLQ/zM/YEnS8eFWcp/o/kEEi+CznXTYbU34XV
         AYuneOv3Jtz0zbcANUWmxW2HeCH/bM6TmeFCyWv1/aZG8DtUPzt7i3/3xEZYu5rg3Ocl
         L4Ow==
X-Gm-Message-State: AOJu0YynyAFFR8TMaCg4UQtN3VOeZBhItGQ+0OobaNe6oEU8auyN2Xk9
	OMeMI5J9557qF6mn3E+WAecrTDUSiRJzYCaXY7fcvNptbeQ6CrDvgMcz5MqmfhtuQdXywTIbcP5
	rmc88b0dNEIVdypx6Xul0FsQSs3lxjlNVDxMQNvx9NaJCPC22kuD2zQaMQ+vLzXEku1wb
X-Gm-Gg: ATEYQzy8luY+r0YmMxs3l+OefhIp6B0Ey92uI6HzgcdxCUPtmiAqsqKbIVJ9KnCzDGf
	5+hWW7I+GJd0jg1hsrtGjLNSkySOM+TGzlXxoFaiylhoRWo8oze6kVZSxT9COwBKQc3gDGMgCcA
	1dxeedwTUsRisgYsM7Xw/hAg53hNDYouTL1ifI7/g2JHfAIWp3/0MLp1TYDtbRbGIhzXkOiRC9r
	f/U5OmL6Eb0TlNvPX0cZBP6dXAg8JQ5nKWPPEnZIWuJZctuXjJWldCkg43qjqWoSf1Qqz8kbuUf
	kOEZTS2M8vXQKof2/Ns9e89SPFwr1BDlJ7dBOxPK5+54k/lumq5paP4QGhGO3SLzTlV4faidWPL
	leGImOTU69Er0DZvqsZCq99rGmhIsPUMadvERQPgHLhJrbW0sIl1DzAMb2fSg/x2zu5jt6hPyV8
	gKW8c=
X-Received: by 2002:a05:6122:1d48:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-56b07aafd0bmr2563873e0c.0.1773138990892;
        Tue, 10 Mar 2026 03:36:30 -0700 (PDT)
X-Received: by 2002:a05:6122:1d48:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-56b07aafd0bmr2563853e0c.0.1773138990369;
        Tue, 10 Mar 2026 03:36:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d0726fbsm4218881fa.41.2026.03.10.03.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:36:29 -0700 (PDT)
Message-ID: <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:36:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69aff42f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=eVDm5Lje-WuPLjdxqx0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: aVZMOQ9h8tu8PFcj7Bz3Ok7bBDZFIEog
X-Proofpoint-GUID: aVZMOQ9h8tu8PFcj7Bz3Ok7bBDZFIEog
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MCBTYWx0ZWRfX3K/eZIBl1bBK
 qua4lS1RdnIvmyyE4ljpg+qb++GCpbLpS1P5Bh0Rbd9lm3bygmcu243Flm1gXFDRGZmuNSy0YUc
 HhZoTdxCo6fHCDnDCjdkQLQwP6fpmAqR2pVGMsExF6UMRT3D331z6hp09fOq6COk5ciyq9UOj+T
 DipFC2wDdlXyjttO1uIZq9ha7232muOeXQuTIZTgqVIjHOGkD/b6NY+Ep0GnDVNnjkIhaNoRmSe
 PiN94rBla9Xt6vwbHrNezPRl3UpaPvKPAEkSKULjzsAe9UzCxiNT5WEpWKmgxNKilPPXd/ImvSG
 Csy9HutuYzXA9rPuvpxLAKvsgO1STkOIo8VOSvQsQcWpcX2Vo2nPYtikHK2GfDVz9uHJzk6kBxa
 TjMjVMKBUDyGj7Ga9hyy0wgW9j/9lUbiGgCeuh/GH/MAwe4A3mJCMTM28RGqXHsEM9Y3qADKLXH
 tQKihGAbbeRCQDApfcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100090
X-Rspamd-Queue-Id: A8D33249776
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-96593-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 3:44 PM, Abel Vesa wrote:
> According to internal documentation, the corners specific for each rate
> from the DP link clock are:
>  - LOWSVS_D1 -> 19.2 MHz
>  - LOWSVS    -> 270 MHz
>  - SVS       -> 540 MHz (594 MHz in case of DP3)

This discrepancy sounds a little odd.. can we get some confirmation
that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
FWIW DP3 is not USB4- or MST-capable so it may as well be

>  - SVS_L1    -> 594 MHz
>  - NOM       -> 810 MHz
>  - NOM_L1    -> 810 MHz
>  - TURBO     -> 810 MHz
> 
> So fix all tables for each of the four controllers according to the
> documentation.

It sounds like a good move to instead keep only a single table for
DP012 and a separate one for DP3 if it's really different

> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> in that case.

Even though the Linux OPP framework agrees with that sentiment today (it
will set the correct rate via clk APIs and the correct rpmh vote for a rate
that's >= 162), I have mixed feelings about relying on that

Konrad

