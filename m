Return-Path: <linux-arm-msm+bounces-108938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G5sCNi8DmrXBwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:05:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 734EF5A0A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89582301DCEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282C02EA754;
	Thu, 21 May 2026 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faC0/XMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEkZ8tfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6739A7E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350410; cv=none; b=sEIr1fmeOrYXpOq0OO5fezQuIvAGUC7yOU6//4H34SgMFvHitdQxEvJtlJDCDf5Z6DtgnOoZBbBiTGRCk9Yr0hHtHIaBAqY+4rUV1XlIJXw2fV0qkC9U6qH+5Jr7l01z6CsQrJXGiW8x80q5eOgcFuiOUEse4N2d1/qsL43E+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350410; c=relaxed/simple;
	bh=PIXdGqeVUA9gIf8fLO/9smTMqHiJUQLQYlG0rQP84Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tuwtLJYxhYfFX7eBsWUMx35KkZPHxI6nv+mpp969oizqE2c/6x+5ppc+OJmbohnTJmJKtNPDUIY/B66NBCFl1LLhwoVXQQZAiWnxDlu1E8IkfGdemjw2W51eMceatTWnOd76I4t9Hl+OqjEz9LysEcAqNVQ1RmuX0WSJNLZ/7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faC0/XMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEkZ8tfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L72guP3049930
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOltQE9tPpawJwPt3pLzjokKU4kONo8BTpdoRrWvcOU=; b=faC0/XMSoJerD1AP
	Xpk+BoX2bgGjtD4vqg9S9b34oxe+Me8ZLP9WAfPDAV4OWNMDXjLoJyiy8RXDR7Ib
	oFpeR99e4NlRdedMV9z2WUBQR98OvW1o6EYteguRuVKSLHsWftTEsxrs0A1BEsmm
	EzORaCy7hABAwBM3ZmCEmy4CX3ESbelJDb8PW6azZefp3YmrtnmIB4jGCk8RLhN0
	WgI23qYBqJBBl7OgCYrw7DiBSmHqDxzQwKJc7OlcM2DHtSYmLCe7pUkRaGflZ/CF
	BK6lgCMQ2sOQ0d0bQrF+KD6g0dViGsE5EdaVv9BQ1GhGVeku9ExzMT9+8Cx/LZdI
	Noq5yA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahr6xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:00:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso31873171cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779350407; x=1779955207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FOltQE9tPpawJwPt3pLzjokKU4kONo8BTpdoRrWvcOU=;
        b=MEkZ8tfvAUpnwQyLEjlCiHYzbJRMpepOgZff9rPraEv0/M8f+Ib3WMf0HvDaO1v0tb
         txsYc9s/atz/Oz5/bOGtjKwpS2i7oZ3n+MTDOUjA1lS3NGsfiHh97FrXRgFF5Zy97kg5
         SznstDrdLC4cypHXHDsniFzY/O5Du/wVEiQYq41n2ZV7qaPjT10GBP8Z3DnyrVE1aASp
         36MP6OYb8653mD/JsVGbnbXuD9apUDuIdv/XtKaiNqWkNAhovowYHVEtHNkLmyQc00CI
         +HK2l977Ou4UhImkPnwakIBS6J9PYjb3/U+8CrdpgUds/qS3rcL7NvHV8u8ZG63jDwue
         0UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350407; x=1779955207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOltQE9tPpawJwPt3pLzjokKU4kONo8BTpdoRrWvcOU=;
        b=MfGIUZ6Vzq1dsLrdrBT+LZYGlVUx2/44468WSlUG5/yyJPvF8+64zZjO1wuyegjPqK
         sjoXUjaiCu/fxyNnB46qb+wTf5gw7dd7eIvVr7YNNgnBth534TSnFPjsnE5XnIIFYcll
         72FVd/nAxON4dhvZYj0FlHsBBgYZVx5dPNIdIauJo0gb/RMnM0wRVfLy2Y2bBk+CZ38Y
         jUY2ohuxp3Icdcycg4vQQMvfHAhQtIvfaVtWA8wIZDdXr3DXcAZuNi8HSU4oyuJr+go+
         5XFglqpstV7uLnZ0CZusdI8p9H4bZ8veTO3TNpXAlEvdr5xM2gUaVtpzqDi7XmLprplm
         KeNA==
X-Forwarded-Encrypted: i=1; AFNElJ/VwsiZLZE9xBjWNbSLVp1PcFKC+ubUt3g4TA36Plo/fOYzbEpTFPa/pj/eAlVm8pfOxepc7O7f3/MJF51i@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3LEwpbBqRWqjUHZBrsXtpXVo47Fj2mootJ1U/4rXvoiHlYB3
	CVf39FhD4O7D7stuZm6IZyTG0b7QeBlXGS+6Gz+oZSzooyX5u626aQS8YYqRbDDskNr4f1q/C3s
	K5wqbDeE0q4xCKF6GqUwp8UMTs/Reorzz5350QuBGnon/NdmTS9jYOfDxOlX+7kCIKZJY
X-Gm-Gg: Acq92OHYB4wq+h1FeXGkVuIZymH9pQLcEnsYvaROX9Ti254CG9eWMEVBfvqtQ5eW4l5
	9uAoF5FcDnshfR3cjITCeI7mjkWy1R6NYwESeR/S18Inh7fahLdT2GrPeH1OUW1PPqIm1p1kIdw
	n2Au4PP53vAFKFOeAULJ6YRKmXkC+P0ODiZM12OeC8QUjUrZDJntDaNUl+c4P+Yp3qSiP45ks2s
	w37VDMOAqlOs+vB3upvppISk8eLCwDuAc4ksfDCMthjlKbQ82d8SgvuFU2xykXj+25EMj2e5hHT
	LgAvDOOznyXsFtu6jNMNCbbZNo4EUl0G/MKRf5Gtn2gT9SIm+T2EhQknve0OClvBTSX5KSgewPt
	Z2Udvi4jXBzZIBc6Wc1A2656xqBjwnXMORzL2d23IYmut/QaHMoTLk4OkFSsovrzujpXAMCpzz/
	7LhEY=
X-Received: by 2002:ac8:7f0b:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-516c54c0464mr18827161cf.2.1779350407116;
        Thu, 21 May 2026 01:00:07 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-516c54c0464mr18826611cf.2.1779350406434;
        Thu, 21 May 2026 01:00:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a50594esm12245866b.33.2026.05.21.01.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:00:05 -0700 (PDT)
Message-ID: <2b5a516d-f847-4cb6-9ea5-21f56448b00f@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] interconnect: qcom: x1e80100: Revert ABI break
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3NyBTYWx0ZWRfX+r6JGmFl4UEB
 0OGv/gkIJNVa8gW5neCvkYZU5sMhE9RrReUir12WD8CT7Egq4/gCm2Jj8wibAMi3nxMqcC6TuSd
 dL0xu6JMrGOyxykTAA5V+s6ZqIg4AQqUy1jnVyG35koEvqnb6P5DRfBaRNpC3qB6DJZwtl0thnM
 Lh5Vny+xseVt05G4iElqse6rwoq3kRQzHBYelLUH+IklnhXoMjQ1VabNz8Zilt1527cma+cGKty
 W6sgM4dN1SDWgwxEe73oVqElDSwBWz34zZ7VnC1TPPtZpCPZmwkd/vxQUezvO5szBct1uGJfSqI
 nqmXJyghq4XJWAyFXTtBKnRy74YU1OaVLt6TZbDSKvee98i00Dsn1Vni9enz1I+0WqiCff5V59Y
 5Fw2X7k2nomJWt0hi5gC+B3eLMR0ligCCL1q09zxV4+a1yK9ft9f08sQoOba5V2WBlEa96oj3JN
 dKEtBH54gv3EcxoXTiw==
X-Proofpoint-ORIG-GUID: Q5OjdwSBmnGPdkXyfJAR1ZcO2oJYnFga
X-Proofpoint-GUID: Q5OjdwSBmnGPdkXyfJAR1ZcO2oJYnFga
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ebb87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mQNDsmP-micbF6_pwTUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 734EF5A0A2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 8:49 PM, Krzysztof Kozlowski wrote:
> Revert commit c70f7dcd0921 ("interconnect: qcom: x1e80100: enable QoS
> configuration") because it breaks the ABI without justification what was
> broken and what was not working.  It claims the clocks are needed for
> QoS, which might be correct, but QoS itself is not a mandatory thing for
> the device to operate.

???

Would a saner resolution not be to simply adjust the bindings change to
mimic the other post-factum QoS clock additions, where `required:`
wasn't altered?

e.g.

e07f3b8c9e1c ("dt-bindings: interconnect: qcom,qcs615-rpmh: add clocks property to enable QoS")

Konrad

