Return-Path: <linux-arm-msm+bounces-91890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLUtEHZjhGkM2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:31:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E0F0CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36393300821F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1753238F94B;
	Thu,  5 Feb 2026 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQTTtLvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwxpngEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB838F948
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283688; cv=none; b=rFicb/vo7dORGQjrU+Ur6RrO2GG0KyJ9t0X+wOeqHE6UJ03IF+NZbbzRjb1o0KmxvARV10GsOn3EiWpICXxDhWZIfNlsFBiqt/QXCz3a/9fvYLk31/GzwVELQeuIkw0HfpoOMVOsNtwGKTElX5CEXe9xwKuYtUjX6GnGi800YAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283688; c=relaxed/simple;
	bh=gxQveDBM7qF0rdFdrSgSO4y6/QY91w1rM5MH2qp7D6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ezdzt4y4GbFGWYqTQItkQtq7lVl7mXF/eUH0rq3gUPQH3zbiZDnQC5GJlMKpAx5kgE2Shp4RHVBMu4zuJIptOmaOajbW0cxKgMr2pqRPD3RPGeomsY1QRb2TsXxzdJU3HqaRpL1qVmYgyW8e2uJ6pwa/1DbDFwEgFT7Too2iuNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQTTtLvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwxpngEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157nLX62946144
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFLeFgRhfVKTGntJpERI+4iO5ebTZcd0XRVPfB0PjGo=; b=cQTTtLvxEKoWMlw6
	yAZyZi5yEvWfbE7vL4+9wq+tEDrR09PTb0pirW3q8QL4FqA2xsOEBCmOdMzQZFRr
	Rh4HF8kd03hmvf4/2/lIBNRhKIY93q/dZELGfSQexDAri1ZbVQADWMtNL6hXiZre
	0lB54dWLy2Ob0MvAVEk2E+VvjhR4TrpRkwNUjREQTScFB8/MDaGQZXsnSdDCKDze
	8dy7Ru6RnUFCb9P2itEYLXXfd0hai6x7xzP8O2M8tnF78q/od3cyB4VUsJPgXJ3I
	k6heTwHzdPxR+icGf97TDO8BOPPsp73RnN7xDicUUNcaf0oexPOZoPQ8Tm3UwuEE
	y7K5TQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55rafv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:28:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso382876d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770283686; x=1770888486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFLeFgRhfVKTGntJpERI+4iO5ebTZcd0XRVPfB0PjGo=;
        b=fwxpngEA1gSEGDUhgAuO9B9QFjBXEM7hvaabGIZqA8QvBqoZRwMg0IULw1Zqxw8brX
         pEvyLQG3hVdsGpfmFhTsmdPYEi+E4xZHCog7S+Ygl604JenMIaPlIUbD9AHWhBy5UK7e
         ludQkN2B9FyPAgLjUF1nRFxBI7nydhjrWaCXvwoYwJ7OgZ1IR6ZfNoCz0kk3yujjQLWY
         IoMWm51K1XP6hTGrecM/TRTwz0G58rX+eDAwH1c+0Ot6ujd2t03OcptxkaTv6lwPyLi9
         4zGMU0VmnQm13kS8PK3pcsUsky8Zd8Ye67pn6Z0lRk7IX/Bn3OJcQraY1v7FaZZlV0DT
         1jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283686; x=1770888486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFLeFgRhfVKTGntJpERI+4iO5ebTZcd0XRVPfB0PjGo=;
        b=Oh9QV0JHeDBlyppw2vlFRspMvNngn2j67MC3UIXySpIJanc8t95YCLc9zKguCBhaxA
         J2fQgIXcvcwLUK2fnJr15U/Is0ZNr/502S6zJ/M56UWfy0zrt7XQdeNz9T/5gqv6Duqc
         TDcv2AB5OQ3nTNkgpA5rRoRB3wCpCc+H+MxWZATcgPSyxlrd5nG1+rg0uz637rvLipHo
         HRNM6JcQtNsKLq9s3/nryGB+gT4yo4I50knxXyfnylK0aNKhihqmE9GKccHm4tDQJNN+
         1qPhNPojdGFT5EHcsz9s10pkb6Qv114IFqwP3Z9NmjZDUqiBlB3nkApL7qUwldjJ12br
         lHcg==
X-Gm-Message-State: AOJu0YyWUA0VyyAXJAkVeqcynP+jjuikAYk1c45CzQrRzAyXWmvblfzA
	eCOeCsJqeNezA6MyqirNNgtjfji/CgVImzqFsNt0FOumVKhXfhcWwow5Xp+N//x0AOGTBc3jtBH
	Q6ykW39VC2JoZpL+d5E7H7CQ8//Cu5Ynf7CjZw8x9K5HERYcGvk4BIZ1efCbvNsDbBBPz
X-Gm-Gg: AZuq6aIN5lMUVOY5Op9fbuxveuS84SUlOPpCN9Zx9yiVx8F79yAnNIpEpb/CDo0dLJl
	ALNbifKIqUoO7ykKGDOE68fwNZgqUxUOmc5EmmXoIEteqAtPQYeiSA91vC1pVvIqaqLQs10QYkD
	wFw7/hcIpQb/zjhXb+tpFJZdCIl4tmMyiJMqWAK8N4QljYPpWALnAYx2u2a5QJdZl5TvUzy4c5S
	4PPRJK2rCzlPxAtUwlYjDotRl0FxTD9gcfFIiZzhtDDArr59MwZjAKxPiX+NCVWYbl5nlpnOPTW
	tmqo2gfCSj7WgZvt/Z/TX407Yea35VuYpl5nK5ml3ELEXUdKdupU5PABWhF99q14UyYlbscq5QS
	C/Dk1d8EiBXCHnvFZCH3+o7iJYVvaZ9QcAByOdG5IdJb4OQokMwlg8XRQLeQg4ld9IXM=
X-Received: by 2002:a05:6214:6008:b0:895:1b9c:bfbc with SMTP id 6a1803df08f44-89522227fddmr57554706d6.7.1770283686138;
        Thu, 05 Feb 2026 01:28:06 -0800 (PST)
X-Received: by 2002:a05:6214:6008:b0:895:1b9c:bfbc with SMTP id 6a1803df08f44-89522227fddmr57554586d6.7.1770283685687;
        Thu, 05 Feb 2026 01:28:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949fd4fc3sm1789652a12.12.2026.02.05.01.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:28:04 -0800 (PST)
Message-ID: <46d0bc58-2c85-4293-a8ee-480282b80161@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 10:28:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Wei Zhang <wei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2OCBTYWx0ZWRfX+stNLGxAdX6w
 h2oS9uhjDMoHvXZwg1TrBF9+rHCLGSBcuprlgwoyjjd3oV4uPbtxEe3wZZ9OE9BjXR85UXFWQA5
 0K83RYaNJL5PE9w+wUedl9fqEzYhqekUIvrNqKzOFbkxiKHndrpAibkhk7UA7afGgqN8dibk+bs
 Z5SxhUefqcVy5G6jwsj/WEMMiwo23pwVXt5MF+d3K5ainwYEGQow+TIx0pM7NoFTGMqngt5Dj4K
 9qwnrdmoal07lcALNlEts12IFZ3/p/QT2e+/Z8NKO/HLUH4JueZwsIx67ysYGn6fSKK0aJViPXe
 BEHPyY7yGlqj0w7JrwfFgud/UAnexY1p/4eTOOvk0RdEVIKjpGq56ajhHJOQDkOl+LjHyjIaS1R
 6xe/Mb79WrpWLNxKlOaA4+8xLF4Upgzss8j4Xhd6d0UNyq5nLRTlv7+AQvz1S92Y8SkW3dL52+7
 mo0wxllQZIXaMrtjANA==
X-Proofpoint-ORIG-GUID: Sl5clDwiM1BgwlAxpUI0qgWTNtD58S4C
X-Proofpoint-GUID: Sl5clDwiM1BgwlAxpUI0qgWTNtD58S4C
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=698462a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tNj8q9q2U3ANdgGxWw8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91890-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 689E0F0CB9
X-Rspamd-Action: no action

On 1/22/26 6:36 AM, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---

[...]

> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		bias-pull-up;
> +	};

pull-up sounds odd for an active-high pin

Konrad

