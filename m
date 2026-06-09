Return-Path: <linux-arm-msm+bounces-112161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KIeWLnsEKGp57QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:18:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AFE65FF62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jfOVLeVb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gpIXi3ZT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D48A3014157
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748B936D512;
	Tue,  9 Jun 2026 12:18:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC9413618
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:17:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007480; cv=none; b=BUEn8FlZTy0pfDoLyYDZLOHfidexnrzQCOSam+RcAGGO5NIztVDXBSU03NHD4fPeoCF+k1J/yVKEBhZpUEeOAEYGY+Yd8FItun6wiLkQtqaosk9Gj77V+SJksE73K64avC3Szh3NyxsNDwQDIf+M66RmCEYV/DYM+Osj6UOvNZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007480; c=relaxed/simple;
	bh=PyCzR3+Nl25myzI1YfYkIcurS7/y1d4WJOtvOLFvhTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3rHKlGfFTlubLr2v7NH6+P8SMUNsHpSy+AKpNwUdNlJxDW53v9syllJvTMn59HhhqqR0YbSt+1o6JmGaESjMgzhxxb3ejnURcz3k1RAM5FhZi1SMA3nNQ2NztAc8RcytTTPECHJl5fhfe+8YDOMGttr2SnY5vPalaHXYTtvMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfOVLeVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpIXi3ZT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Bnonk2455607
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tmxBapM7OGTGqduy8bsdDU1Gef3pqAKNCey8QFxRO8=; b=jfOVLeVbbSCq5BIf
	X17dCHliljGOUecJxnpv4FFFqC9Rlomrbjxt9Jic9IDKOCK/cJ/JvsLA5OPz67J8
	94+HbO6O18eZEqqCMimWp1Nwe5fgVRerKvM1WLAyWXGqPwH039xi6SErPQxFagu8
	WMAgA3asKhWzyJUcm2yy85uy6FTlR+PyNV2Pbpg6eXxepbH8bL3x3ThsRZQpT949
	FjPz0bMaHCjKvDJ/ZJaBriyo3N5CDKDw60Z3pSUSmCqmcNvX95OaGbcGDzZz6Hum
	6IAXArNohutCJvVRfVHoudN/xf/K0dc2PZLad2HOmo4ZFupSIp2tkTwY+y8xpeWB
	gKZZDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4h5p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:17:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91571f0d3e3so88088485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007477; x=1781612277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tmxBapM7OGTGqduy8bsdDU1Gef3pqAKNCey8QFxRO8=;
        b=gpIXi3ZTqWL85LMj8AlD+fHIVgmSCnGgnnJ091D/1upFvlrpzF8EpMUiPTKMztbV+U
         gjUBzVHD7PIDr4yTznxujRYG6uEMNczdAQE89/eFSzzzoYp4m9OeGgOc/Wk3m187jmj6
         RvH50RXsLxBWTJ5jwBr0B1QFxNDuGqAujmTHCMJ5dN7072lAEkBipZOWj5H1c/b/vlqv
         n5CVMcwRbqmHr/QOQrGzsSoUP5Fh3MqOS2AFGw4UMjyP3BbYwvRcidVfjd4OxFf417y0
         6ylQykU/tPtS5t00+VWJVQuQ5DjoMqzMxkRvBilqTH7IgbHSf9kkVYvO4ttmCbH/9xFx
         2Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007477; x=1781612277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tmxBapM7OGTGqduy8bsdDU1Gef3pqAKNCey8QFxRO8=;
        b=fWfDOfQvZAI7uAuMK6XZVJ4AC/7Lo+jJPmhU4pZFdpsUj76/mYdVOnfXg0p7glIUko
         yn1UMK4kf69fLsfDCH0Sjt9zdY2vifBpdxfg4KicdLGWobThyHc+eYjY4IIVuYCqAuFY
         mDUg618NNa3+mz4i7TNrToaDRFUHLGGsArt0u9DKl/awV8ZDu6AkI/Cd5CWzS1UK1YCz
         i6E6wZh0Koc6PTrDuaVZvVmg/7jYZcUfyntPZ/KhnAwh8vIU7gL6l97WlS6gERVHinyE
         rDx5/aIUpEy1rtc6Y4FEwsVx31jBdO39SphOmyiZl5J3cPVYV2woaLLBjl+7O3UvZUoo
         Iyfg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZiRLWMUbnoSWXomUaQTV0prrSmTJEbShuZWcbgVQG+pwhtiiLjveQ3ZKy+k1+hT9zz5H6Uib8/fZp6B5m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2982aAsUDe8dGHZVz5wWnjifCeMoDK7svYCJfZdZE26bI3ek
	CIPMVKljqSbv9Qst2482NVBtFQd52Y/voXkKqaKRlg2tPu0ngXIdwodINZBQv+XsAUCvAb7dl05
	YLU9GxGQE44yWXjbKGr9pn/XrnqylBgTqOjh7OUQMvDRZrL65GMIwOPP3MLYC4aklZXxv
X-Gm-Gg: Acq92OH3taydNBdGbbj6W5BtdEueduNc5UB9tNLbTsgrPmCP0BmtaRP//aHM12LeqGt
	OHSPkVsr+ZW1ZdWkhHinrmA0LgWKWDCcBENFim5AMaegCT4/w9E9apVV4YwvXfbauJ06KPDidEW
	nnS2TbfKZx1dp0Yg/b99CXGju2RLtjyeniMGEGu1l0FTLHvEpe9vQTVr5ZWze0Flc+4/+uDBKSO
	JeYBrZgUxv4Ddp23ZS3CP4YqSzaj0p0suBwAZ29qrtZ0/AjOheUSTjUbR205plERNgO0IRdLcvH
	p/FMQxPqjismTXJL6iVQP1sChCcRTpcAoQFVc9w4nGYUU6zlfsdWzSOKTAX5djPLOhIJLK3gaZP
	+ReSltCz0c3Bxn701PVWAVycQaEJOqYu7jBIA33y//cz+yekTeZYf4n31
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr262374885a.4.1781007477523;
        Tue, 09 Jun 2026 05:17:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr262369285a.4.1781007477008;
        Tue, 09 Jun 2026 05:17:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65868049sm8443619a12.24.2026.06.09.05.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:17:56 -0700 (PDT)
Message-ID: <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607160435.36546-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a280476 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=DV1FWiXnHoQvedXQBQoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -mWuUQy_GHxQaz_NNO3PSPw7MLWxfM2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX7h2kLEI7sBgA
 oPBw01jMYissrz9nfA0As2EfZ6buFlRAhE/p/ITWI4aqAbq/jHm6dA+0G6ABnuir+3hRQdQA6Yt
 079tmn8S+Uu+nLqWHqyxDS3fppImdz4lJ0yIpY6hLc5mBqzvsz+PvuF3wzk/MimabK8ItFSk9ay
 5FWNRoiZPFIG2ZXBhZnWpjP6I2ths1STn8tSqSPtRQMeVji9cy0kNSRmL8Sr9ynqF5hF0JP5BiG
 eZHSFUACw9dQwIBhJr6le4tm1kkmax8DalshykUg9sFXDwMauPXwsO2iUmjBqsAMB/eRkDfk27D
 ktNghQx3v7tsKhhyEqSxfqSQ6zhjJvLRM/5qeC8a6CvVY+jBzSEC+4tDBll4VgooxU4jH8h1u3R
 fGAqvExlIuIKl6ZGErllsOzj7xWo3SFTrGqt8b5SlRYm/oNxnZx8rWNi2zWp48N1eToKNCA8ASO
 novF5QnWPDvEqjh+JDA==
X-Proofpoint-ORIG-GUID: -mWuUQy_GHxQaz_NNO3PSPw7MLWxfM2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00AFE65FF62

On 6/7/26 6:04 PM, Pengyu Luo wrote:
> Define pinctrl definitions to enable camera master clocks on sc8280xp.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index a2bd6b10e475..0dbcd3069a3b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 230>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio119";
> +				function = "cam_mclk";
> +				drive-strength = <6>;

Other platforms set this to 2 by default.

What's the value set on Windows when the camera is in use?

Konrad

