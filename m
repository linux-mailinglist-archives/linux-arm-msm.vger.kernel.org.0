Return-Path: <linux-arm-msm+bounces-114331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 04fhCPjFO2oNcwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:56:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B46BDE05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:56:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y/yc1y/a";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YDGj2nHa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 182043034A33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9251285CA4;
	Wed, 24 Jun 2026 11:56:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FA2ECE91
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:56:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302176; cv=none; b=LBR0EnBPkn6NUg+FBs1mvuvWqBvYPogglhRvJcP7QyLdjBydlkoLRRRp8Wei7CUavazQrL6x8dWRKNTpdOjShzc1+r/tbET3R/FEUohAKLC0YV5rR+oRVu/SL4wxZMcySdxDdauDnyJYZsNx9m8TmPnXjNvP6lYv4MTBK+JgR/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302176; c=relaxed/simple;
	bh=Ngg0cGGv2Wf2QNNVEbm7R7xNMHMU7fSuNiLkGSyhs+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NECkV08qMIen+8t0T9igSwKyIDNkF08IF+Jae9sMVfa2x8uU0P/KdZj+YW0vefoKQlMS9kKa7TdyhrhuK5BUgOshdpDMxknPEmx7o+6zkKfm6m+l8qDdTSmZr89qA1UPoyhx6Ows+IV6pcRBHpMkhDQ7F1AVsnyhHEV1mg+yHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/yc1y/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDGj2nHa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANmQ23070348
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyPN6EvgQxaJhTFxH3Ut9REWWNSgLGQUQjpDW8qVC7I=; b=Y/yc1y/aD/s/JSaB
	qzzG0kBATesvCYN1rH8/IFWlA9qjzByPEvXFwNbQZDBePzUQ5AGCbL8Lym0atLRs
	pI1g3z9g/7YS+/IqhpCAynZB55ZG+7CM4MckkiathLP44WdWLYznt0VkF7jCFipQ
	UwfdSJGHhsWobJiRVQarE8YGMUy+TM4UPvc2rfs2xQ+y7nm8cvjEsXMl+T9wAnEQ
	cWY3rVrMjg6BnAa9W+kmmkimquYfIFQXuWLlLyHcE0Mcy95wR58t+Kp+GtevVFew
	DrvgfIcDJeQZNvBRr66hSxqFo7fIrBC5SWwI0j1aAuFzZtFFHTDSq0U/qzHV+k7/
	Q3uAgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g0d66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:56:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so25337685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302169; x=1782906969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyPN6EvgQxaJhTFxH3Ut9REWWNSgLGQUQjpDW8qVC7I=;
        b=YDGj2nHaTNdqtKXcex2/FLD+qyxqtiN39y/8N9SZ8Blgzoc9i5r/ArOyw3xtjrbcoo
         kjwjwgAxCWcjwtI+4VXqy6PRu2Q927nAx2a+y5g5jzXI1VxTkoKST7wYn0f1oUdbnYwX
         +W8TJgjiyVaAm7TU0SplkR4hiKpV6vYT0wQTQoIVipUDmxekyScKdM1UQvLcJRr29/iQ
         oZX3M6wzM7FhXXRAzScMRjkdN3xFGxUDXhJryJirSWHgKaiO1y0WeAgHR4oaXGu1PM4u
         6lbJgtx9kG4Uqf/vDXpUlCg88IaVaIe0fKHekYgW3h87ShzmTFtl9H/5q86bhzM15kMR
         rq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302169; x=1782906969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyPN6EvgQxaJhTFxH3Ut9REWWNSgLGQUQjpDW8qVC7I=;
        b=ncMDbm7L0SuOewlKddkwVDCp6fBbKdFLo/t1pB4DlZaHsmubN5LIcV7SVi8KMhwnbb
         wiZIMErfjGoMy/VSzYGAfZr5cyIYvesjR06Bj6xv7LoPX+eyicqfVULekwGc86qsqKzp
         szV1ET7nPFwRFOZmq8PuZeiN/3hktsiEMAEPWbKb9hK1X4uVrsbmJ1kA8zZ0gXzRzczS
         79Fup0lb5cc2hr49SqIL4WK5obRj3aALt6Xv4kyQBTXoGyovFpWwOFeXBF1+jjFWm3Ev
         ZynoqowRpCb91XYl+ACVrVBAxlaF2xpechH9HMn2avT62kr3+QmU/IZMpzyQcPCk+Yw4
         lJ2g==
X-Gm-Message-State: AOJu0Yw3iwI2vRV7eo3yr4RNBRFLcPIneCeG5yYEryXUbePEH8lVV85/
	+WhZteCRq6v5p7IN9Q7t1OHffEbtXElkR1CVnIaJ8hpTXaXtzVGjU+XR/L5+RI4J57xkx+ZQ4mr
	XFW+qs+tKsH5BP3x0P6xjFEpV/4x338vVl7+Zitxc4Kb8nlaNLFszTMe1SfhTFKY4SPZm
X-Gm-Gg: AfdE7cn9dZQ2uwvGm9rm1xWxsu7jBMehWo3BsbYDc5tTvXz3mS1MyEjAIYlNsM9KAzT
	Ixef5ACzea+gsN73kfB++tahmYnsu2l2mvf95Qkiyxb0HKUJWpLqpOwT5BL+44TDgRyra8NV78u
	nIsGtaHU5mH6w6HCAdoM/2ZMNbuvht+Xrx2XIjShFJ9MKfY47VCVnMcVTOAwQSIvilAzqNtkhqs
	oibthFxTSv8iy0+KLm9Oqz8gGt+ltbkP6PJak22BkZFr2BscJx1oDBq1q5mn+tMtu5gylS7AREF
	BsGv+TvXrPWb4MagHkjL0+xhpYue4qco25LSEPbEIQod1bjS/kN4RkXe6rmdYTh+Xa4AaHqXA3W
	mUMSSvOJz4/aj54FdKFOPoLOcQ1zus52on0k=
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr956991285a.1.1782302169316;
        Wed, 24 Jun 2026 04:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr956986285a.1.1782302168573;
        Wed, 24 Jun 2026 04:56:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49aa07sm648558966b.10.2026.06.24.04.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:56:07 -0700 (PDT)
Message-ID: <896f3704-e7bb-48da-a501-0c9b0228573d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856
 front camera
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
 <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3bc5d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=dZbOZ2KzAAAA:8 a=jjwmVdJPvyX2indV5vwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lMlN6uQzVTATdAXSR2xRJB4Gtfnvoqx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX3fwxMnwqTJx6
 cvfBsXisADUaFqDilrq8RsYDt+mFfio2RP7+GKlevmfHQ+m0i2afZNqxIFKggWDmYIW24F9C+y2
 1gbhFx1VhR+tozZah4gv9hRmcBbR4gBq/32ywBxb4hqO30dLozhCR9srhCkYe9ShTsL26cManMO
 azzxZVlfOCCezXoVj6lEXBdbyHd9Hasl4UenHilOfCeFOGKEH4mzk2mTuNFvFrgRVSnT+DjaeoB
 07tnXLURkHLHp8OVI80xgR5pJr5yXdsCXdrxDlEMWwAaU5GSYrcWKu6Wp/mqVfvHy6GKxx6N3Gz
 evRCuhwpA4YpA/7dQ2Q2/zAhMhBIgYXdeC4Zs4VeXe1nKtj7wIxt5w5AIUPByWqTf9/SHnw+A2N
 0fDknuxKeJGkYHHgxwi3+qYYRI2AqQ==
X-Proofpoint-GUID: lMlN6uQzVTATdAXSR2xRJB4Gtfnvoqx7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX0tErx6Sm8/Be
 T55y6XBEXqdvW1DYIP/+cNw/PNaGsLLsnAieS0iT2ivRL3e1FxUiUFJYGJD4DSY5qVl/xQXvadn
 Fcgxxc34lfwDE7aX/5rLIomOjy3Jhuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114331-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qq.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F6B46BDE05

On 6/22/26 8:52 PM, Xin Xu wrote:
> Add the ov8856 front camera, connected on CCI1 to CSIPHY4 and
> powered by pm8008 LDOs and other supplies.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

[...]

>  &cdsp {
>  	firmware-name = "qcom/sm8250/xiaomi/elish/cdsp.mbn";
>  	status = "okay";
> @@ -877,6 +933,20 @@ bt_en_state: bt-default-state {
>  		bias-pull-up;
>  	};
>  
> +	camera_front_active: camera-front-active-state {
> +		pins = "gpio109";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;
> +	};
> +
> +	mclk3_active: mclk3-active-state {
> +		pins = "gpio97";
> +		function = "cam_mclk";
> +		bias-disable;
> +		drive-strength = <4>;
> +	};

nit: other nodes have drive-strength before bias-disable

Also let's move the mclk pin state definition to sm8250, it's not
specific to this board

Konrad

