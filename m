Return-Path: <linux-arm-msm+bounces-107905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 43p2JIoeB2pbsAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:24:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 895ED550674
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69BBF30243B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A7E46AF06;
	Fri, 15 May 2026 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTSw8f2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIdm6K6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C747D95E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847973; cv=none; b=jnyE5OhGbbn7800LljcqA7yT83QdPu4wWfQnYtVgLj4cooz74ptq2yj5vnBUoQKM28bgW+CT8hcj6KuBXO8xKAemcBb7LftCY2C3gJ5RPNcDGnflGC5XfA77H88wZnJAAHXCkd6+JEXFJW7qvJBrssYdXWNu0zsIQNmPObkait4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847973; c=relaxed/simple;
	bh=iJIZQDoa2/E8Qe1v8hcOOpN3cVgMl6qU1fIOM6gzK5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuKAgoXvhUr+NCcEObJbRY9jivfNXZ2/xPkAt5a6UMycjSET9DHqlBfJSF4DeXkACKVP+WzIzmkalraMm6F2fx/YHDIIzOmio9w7rXS6uMdJCDQ14K4TaplxlghdR2XjkD8YbMxZ8aX2D/gec19GkPa3JPzY08GSUBjg0kuj5a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTSw8f2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIdm6K6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAMBXr3671009
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3Gh63lxdcQDm1Y9m1WL1VQ1JCZamlpt8A+h4LCdgZc=; b=UTSw8f2K8Nt69qKi
	8nDWK/C81ASL2X5p3ypmpaEB8IUOm5WqngtqF105/Vo+zc8osTqt9xCwA/oCBXJ7
	DmQD+tx3rProm9tWD1J6jbOwP5VpHAJ1DX6EpZgx10jC9ofrtxvv3iMLO2WYyLF8
	0TQgtVUOGjomhEgKMRSWwGiM1Mmb0EiLlAsc6KK17SvyCHDXG8AzBjwogndMJ1wg
	4ArJQaQhrzigii/BKSTZTHcvDcP+gS6GGBxnqhCjd+w0Hr9mk1JPV7BQ4j2ifQi8
	RzcZt6X9yo54ejhPckUny86xlz2aVSez5iRzmQ/Ha5jMKvi4XXfh6O5N44ku4P9f
	CK1G+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s397j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:26:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90e0eae822dso82436485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847970; x=1779452770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3Gh63lxdcQDm1Y9m1WL1VQ1JCZamlpt8A+h4LCdgZc=;
        b=IIdm6K6F5GqznAZ0prC7/FgubdmtlP/OtlSZpYGSJEv+Lu7XFvMwmHrLf4dZsyjreT
         iXJs7fXewGRsTjy0MGOGk19DI4a7BD3zXr1QHS36ME631H2V1GX/TK3Nch0vWtqpS9DJ
         ETCma4OJOGcj02oHs7skL5YrAeah7C2N+QN4d6dYgK4ghe+AvahTfFcvEYSYz/HVM79M
         rTaCfQ8HqKnzDlrjYLMrcA/boBk7W3snCB5p5SnZ8j7255HsEKAG4BbJs7U9rntjXCes
         fj18GBhvu0dPJivAgfcvW+i569xYmqnYANNl9J62IIaWfqC4q915w3R/qjZVBR0AEJG5
         21aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847970; x=1779452770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3Gh63lxdcQDm1Y9m1WL1VQ1JCZamlpt8A+h4LCdgZc=;
        b=mhHtHGjwRseoU5UrEjRNa07wKYu7+qxdtfL7Y/QkzRT1psMKcZEt87iK0riUpA1/Ki
         f1d6UGmFBSvDiDjz/ISF1MRML9iU2Kdy2CJPwxsxsAT2IhMhBtXtXEzPYi6rt47p8hh+
         iSvxfbIGK6GCvv9Txx+GKGrsi11hlnne4XCQz6k1mviHb19RtbCPXJypfYYBqarsu5Cy
         l6EaiZFhUmOutYor4PIYZnw/DJIdfHmXL/oKNzbm/6v+svtZop2QTTNx6f+qrNr4Ip0w
         BbTLMaJLIFu7Xu/BvUm4f+9nFaLS8UYUuH93tdY4dYppI+BvrVEwgUwa4OhprLODC7Ms
         FM3A==
X-Gm-Message-State: AOJu0YwdPWNVcvHBF3aJ4KPswn43AqhZ/jEcJJLZb3XNI65uORpfQxCn
	0bxx+Ah2PtKlqRaclxcb2axEbkHIxwgZtTnisBImw2rLBLZOk0vSgOe2rrLgqk+RiUT4RhavYls
	Mp4hVbix+CsKEy4T3GLKYfoHlGlfJxBR2y1EZBp1iFo5LCLGOV/i6xQOLsQPK04u+aNAo
X-Gm-Gg: Acq92OEJmsEK02A5E671Fqn1FaHwo+0ocjS0RMGYVXdn+c4PWcg/nGlRwJzCnYNU73K
	B1mqwRHG67IcSaxUeiVwyOWYAy1C9ChUchETFpIJDQrIbuL+CHz4VqyS0yjAGOCfJfl0Bu50jrf
	dWdUFXE54nOOKKdxMWWXHaUbWbMwsn5pAvzihyAuNYUVgtVr2gSWNgX0hu6+Uu2OJidwwK4yHxH
	szn/92AftsfcOp+e2++M8OT89MNDtpbh3aGxHK8Jg6HImua6H0UJ1yPQ6WZYWS1gJpGszdUC/Jt
	FtLt1G2CGyJM7kJ1xJ048zfp9PvZ00sawGs13/E/0pA2FbItNVKnhMiakYugAxXsFKM9H9DjVG5
	qjYcfkoywCkJEvtAh1QhYU991StdHQEZ89tGarxZexikir1jCxCM1weqZx1BgeFrHbd7kj+R6ia
	GYpNI=
X-Received: by 2002:a05:620a:1997:b0:8d7:ed38:8189 with SMTP id af79cd13be357-911cb003cd7mr402620685a.0.1778847970419;
        Fri, 15 May 2026 05:26:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1997:b0:8d7:ed38:8189 with SMTP id af79cd13be357-911cb003cd7mr402616685a.0.1778847969926;
        Fri, 15 May 2026 05:26:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58c79sm1980407a12.12.2026.05.15.05.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:26:09 -0700 (PDT)
Message-ID: <49af220a-6e9a-429b-a98c-4cde0aa1671e@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:26:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650
 tsens
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
 <20260515-tsens-driver-v1-2-015ca76f1418@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-tsens-driver-v1-2-015ca76f1418@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNiBTYWx0ZWRfX3pxct3xQILf2
 v1m/nn6BEKEzTS7SLyNe1Br476rwCQXJjEQgY/jz2vHQXAh9c5MN2S9CrS2nSbIPFfQJDTtgwB0
 z5wx3lzuPsw+heLg1y7CzabLEurpb7WzkaFhhEPz7kJjlmg/j7EdyNqy663Rwwz5xyDT3zBiHQL
 eOwNlskRj5x1SPB3OoJBTBGHtoCrBZks/yeDiesMqbCWfgX0kkyE9E+SwTU23jstqhDTpPen6uk
 EgJwzgfTnsG/BVvM1zKKZ0wyQ7lgWFVO2xov/eOvgmeq9T9Z5OnSJac/mtfEw7NyjBgVtsEHavJ
 eazO+0TWWN1lWkfCJKF2oOb/lcGfPHrnXb6WmNpnUjwwke80DqzZA+AfI+evTrWpI5cUNPc0FJV
 dOM+JRoVjxYrqcYhkno0XZqtJo8teJbgYLG31C64w1d2Pe6rh9PInNGEq65hko9GS+2YFAXG51h
 wIUvelGsF8LKb9xj3dA==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a0710e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=35m-WzFFBhUzNNwjB-kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Yb640S8VOM7iWXFrcrSJ4THb-FxgdfU5
X-Proofpoint-ORIG-GUID: Yb640S8VOM7iWXFrcrSJ4THb-FxgdfU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150126
X-Rspamd-Queue-Id: 895ED550674
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107905-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 12:18 PM, Varadarajan Narayanan wrote:
> ipq9650's tsens is similar to ipq5332 tsens but has different number of
> sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor
> related information.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
>  drivers/thermal/qcom/tsens.c    | 3 +++
>  drivers/thermal/qcom/tsens.h    | 2 +-
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
> index 8d9698ea3ec4..ef1fee2266a3 100644
> --- a/drivers/thermal/qcom/tsens-v2.c
> +++ b/drivers/thermal/qcom/tsens-v2.c
> @@ -300,6 +300,14 @@ const struct tsens_plat_data data_ipq5424 = {
>  	.fields		= tsens_v2_regfields,
>  };
>  
> +const struct tsens_plat_data data_ipq9650 = {
> +	.num_sensors	= 11,
> +	.ops		= &ops_ipq5332,
> +	.hw_ids		= (unsigned int []){5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

