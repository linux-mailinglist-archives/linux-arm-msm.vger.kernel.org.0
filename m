Return-Path: <linux-arm-msm+bounces-106612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LrJJ8Gw/WmlhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:45:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0ED4F4692
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DFC23096F7D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0733C061D;
	Fri,  8 May 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu1MNub4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXpEutrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB743A6EF1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233344; cv=none; b=jKKslGH3ZU5Qn9avo2j4zdaUvn1mopqylaPKFcaRbXwc7blvILAXO+b4TJHYpMRiOIRBm5+/JHLjZaauoRLd655KrjObL/r4psRH4UVPDNUxvc1nixKknTk+OXabtWJqHrRwoPqegxEFdzrq75oyPOcNf9ECCrGTwBhhCHzRcok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233344; c=relaxed/simple;
	bh=ok4NhKFhFvcs1mNcsqE+TbllqAiBSnTux/fH9ElthSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaTrAjI/70hakIStYoy13HdnFuVOsNHh2D7k5rICXnmOfQwFFyHrPUvQIPfpea4j9/cJ/YoOXG7SdvEj4AQtnLzcySS8yKi5mOiXaKuYq5YJQsvyZ7/rZqcuda/vhx6Mrom8lZHEoA0cp5x7ScIRMpECST5uHrIKXcn057Ui/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu1MNub4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXpEutrU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489VxlF2771502
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HH5TCDVgIoATyvoRqqRAUHJllMmgH1RFO36Q4LRp7d8=; b=Pu1MNub4sFd3Qznk
	05DGS3PicKOpMtkkydkvyBwzVd7kv+J+BRUMihraDy8EVOrnMUm3kcn7wcULlggv
	VPJ8HdLpQMT5XkougIv6J2gFaN80sIbUYmZEgd2VQ3QEg7jycptM6q71Qv2KfpVM
	hac6DG4swg6p+IaSgkpA5TFA2YgkJ03EtvqJ9aFb7ZMtMjDdlehdNUzLhm6Qx+qZ
	UOJqFL4hAvtq6SwT1kQcptuiJYCrfn4cIGI8sMEgEp2vy1KMkRt6/dRTiUDY7VnV
	JG6Yj4GqVow9LgIvuUyhQoVIhUJqiLNjNDXTdCsiaXKZJKVD8GSo3fYuFJBgP59z
	Q3qMgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k2fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:42:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb530174f0so43887185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233340; x=1778838140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HH5TCDVgIoATyvoRqqRAUHJllMmgH1RFO36Q4LRp7d8=;
        b=UXpEutrUZEUgEOTLXUMRJKHhWYnnXjuxILIk68+qrFI5bZMq51v/5UW/b6KtQZ1zkw
         eeG+f3OvaAAOvqcb/GHMFBa4A2mVcPW7jCvYicPogA6AYmlkRd8vs9CGg7ed4WvRtWyd
         B+pRSmmOf9hKCqDbWMz1rMMTaxPEMnqDOTAosvPX6bnW4Yd83rJ4WRUhkiNiJ4rAbFNM
         E4Xs/ZFNhCaTmZ0mMMKW4aRHm9fXk3/mFK6+lXN+yHXtVJdSCdJrXWtrwEb7Ya1HzIiA
         pcUCJCNGTYXmZY5jjfk7QM1UOyFrRMb21rjaK9s7MTY4OJ/ljECUH9NSbEkKgdwk8+GG
         LA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233340; x=1778838140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH5TCDVgIoATyvoRqqRAUHJllMmgH1RFO36Q4LRp7d8=;
        b=sYtI595nDrOYp9xlM6CoXqU1Z7Qp51WG8aPivUT7KqkhHTFX+ZzQCguk2wL3fMaDGM
         T735kO3wobFxfKsW1wbOwXb6Wfb+v5RUFs17AcxTd+PqMKU3MzFjt5OYtSjxw96YLQzN
         URdiiRNfxKMt3UZhExwbrO/IsGGwIymc4L0dEURuOW1PAF2XRJqUbORahhMvUFdg/wYZ
         DAuBUI6HXC9MOuzV4kwNZYqYdrwU04+vAymKGDhpvzNxBkgA1QKxZgVMGX9V0IyLKWUU
         b36dENDGUOlIKn3Me9rC5aAoiQiEiiXi8IjGv/GxQwywzcvvLChOdbHuZBJqkZuJ5Hbw
         LU1g==
X-Gm-Message-State: AOJu0YxYv3ArYqHAvMfoidTUckO9OtL/pZCuK30coWq751avgx1ukL34
	KR5ZQ8zxozTHgj20dtp3sojtQe2ujfiH0EUtYknlgXwhUe56nVUqNx8loz62uHkpCmw4gm7+vkR
	MnbzoW5Z8+E0iWtKvRmFQNIU/2JRucStAQg7g6FXLxNXX+jbXVLSrtxuRTgLoCZiiTYlq
X-Gm-Gg: AeBDieu1MhVruE3Bh+VVQgwhgI12dniVHDzLlldldkuZ0200wi7BzigN36AGSS32ozd
	3l+zsE4Vj8UnT96EGuOKSAwJ8EpktKy6Z9FuxK6FjbP/MbirpMqEs/u/0NM4QGw8pZf30wYJ75/
	hTkd89Tay4MgJb1u8r4t6m+ZUzS16icwncDvFtprLSLcItKwO40TomBN/2mlM4oDOye8GqD+gT3
	AxaY9kMahRytbt28kv72lR4sipHUqdD8ttwc3px8SUDQTHbQ4dwz95VrcRI4jdk3T9gEwAmxo6W
	ycoIZF+ZfxySL6bd6X1VoRQi5JMu8BN09jZRGzsTITmFi5LfW6I4YW/+45RzFMFNF8/YaaMRtlu
	C789MPIgwdpRAMsRjQCeF7369i0xywQJtNxZQ0H2DU0aA432dBRfvg4IKyEXEVu0NMjZ7Q+VRQ4
	sOUL0=
X-Received: by 2002:a05:620a:46a2:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-9051ee7d238mr1080082685a.7.1778233340222;
        Fri, 08 May 2026 02:42:20 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-9051ee7d238mr1080081285a.7.1778233339848;
        Fri, 08 May 2026 02:42:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1a221sm451304a12.24.2026.05.08.02.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:42:18 -0700 (PDT)
Message-ID: <510811aa-df44-436b-a435-b9cd7ad16367@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: drop unused
 polling-delay-passive properties
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
 <20260507-sc8280xp-thermal-zones-v1-1-33d4395b1be9@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-thermal-zones-v1-1-33d4395b1be9@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdaffc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=nRX4f6Zm5Q-hqNJcDBkA:9 a=QEXdDO2ut3YA:10
 a=2o7jZtLZQagA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: za7l2LWy9CyYAZf8u8vi64tVwU0spDd8
X-Proofpoint-ORIG-GUID: za7l2LWy9CyYAZf8u8vi64tVwU0spDd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5OSBTYWx0ZWRfXwj3rhEDNliRQ
 WGoPU4AfWdxtlEt1nkdfr42VSsYW7EiM4wVP15Qz3TenPvIVqkQDi097rcmaxz1TSd+ZSo2Z1Av
 6OJO2LAQyWIrNKvVuow0574fMG6P+L8wFPhMTZGrGGHn2QXzdy52XrdSBaFgppnikIj43us/sbq
 RgXc3owZ26lBE2/iNaccOr0rK3aZPKm7V16YRQkIR5kPIRO9+Ez86H0xpjySm+HX9tynUCk6kUm
 37zKqu3AOIyR6mg3+iiqu08ZIBrtLmP2nO/+93HvF+7bzWdTm9HuXI/7WBvevahCEUK7CETGImW
 hYlSBnzTbF4XUFpBf+Ed2i5ZAroonow0q1m8gotudZ0Ai7fxmmdE5Qn46Flz1eGfB1U+ZgjuA5e
 Io8qbZtGbBanaoRx/Cvtz0RqJgGVA7RL4h3r8ui+46sQIgP31Tzx55BrXP6+XoWFgktaGJWQZSj
 Yc+Yf6ruD4YQqCCEPwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080099
X-Rspamd-Queue-Id: CC0ED4F4692
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,radxa.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106612-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:34 PM, Xilin Wu wrote:
> Remove the unused polling-delay-passive properties from thermal nodes
> without a passive trip point.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

