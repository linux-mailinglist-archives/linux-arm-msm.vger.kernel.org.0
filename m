Return-Path: <linux-arm-msm+bounces-92695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME7vN8LFjWnT6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:21:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505E12D648
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F633089036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B950327E7EB;
	Thu, 12 Feb 2026 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCoUZ0Y7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCSiZaWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926DB3451B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898689; cv=none; b=Gez1nN68T5zG+M+ADjQDWIaNDCsCEh46ftUunQyd56wqoaXzLIVCD7p7Ila9l320DXyyWKyOYlQgaJxR5zs+rvPC3y573zqpeMbwrmuH6L9xXXuoTt457edn3W2emjVxIT3CP78F+pHTixTQmLhmJgbpSCovKRyRNCb53SH4VFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898689; c=relaxed/simple;
	bh=tZNmz/GkCc2LeZnUTZNn5WfT7Wd8oGmhiKED8TfDBnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNv/rt1BKqRiYq6gHuSqA43t2Xlixg4D65wg2HxJD2D1pSKroeBGjDHvcEMayX1uIZ2rpfmGdVj/SbSsY4EXNlObfQwwT+zQRCIbVCGd84MGRhhwN7HoE7AjUKNXLI3rx1fzjd63j8HfyQzSff7mcqzlp0bjUQnEAPZGIphkZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCoUZ0Y7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCSiZaWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CARaJq272086
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sl62RI0YhZVODTwZ7OAfNAAaBCBIY1CZkUoDNZuUFDs=; b=TCoUZ0Y71TMv9Ed3
	JxOb291jopXU9lcKyS1W/aMoXs1XEQNi4YW9USciB1xIpqKTjBSZ7j+yx+JA3SNf
	MnufkNcaTOcoYTZ+/bJdgGKjVG1Rc6PWH02hkrsmLsYfNJ3Jm9YZICyA8wbYiN67
	l7nfWcW2Uz1jGsDfwTmRKsgQj/Mwgt6m37P8gIBPLfZbTXgCRyBFDJEKkcn1/UUB
	7ricZMbeXSVpUR2bS9wHSqmSZUb8a63+RGrifD07xIUzJ4CKngVXdIN0MHX6lQQh
	l+3p9B9P5f54XX7bVBYCb6LSsoDD27FBxlIGXy00t2l3FiwwClIIGcup47h/5+pC
	0WOQHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9btw3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:18:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso22654316d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770898687; x=1771503487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sl62RI0YhZVODTwZ7OAfNAAaBCBIY1CZkUoDNZuUFDs=;
        b=TCSiZaWvEghp+BExVTzpfIShZgA2iMWmBUdzKAma10LgmQUYipq+GW/SCTIr225q3o
         Jg5S6Dw/lZDeVK047lZVblKn03CO87bX+d4S7vW0BDOgUtSABqxUxBwAMtu24bz1s/oY
         nUV/rfNKhTgenFU73NdGYiCQVdnaLyNoRsQFFG8C7A8+K62fMPU1jMx3s9roiGtguVey
         /n4fA553h9NWBAAruvhAvFpZflGmP41CcEyl/TJO7snOXmAaDLdYCSbbM4a6R4ljH1Nu
         /07JLUWZnFVq59Rp0m6VT9xsoAQN4i0d/zhUuPHXu9hkmglXkowHPKlJ0sIgtRNQa4Bc
         zf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898687; x=1771503487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sl62RI0YhZVODTwZ7OAfNAAaBCBIY1CZkUoDNZuUFDs=;
        b=tfZsXjNdysfNd6bQZF83uLT2kuqHOc+nSxl1vEdyctIKLSpBEVByY6zOmCiUM65hr6
         9Mf39hXqp2g5ce/BK1cEqmRidBDnK6GkP17lKz668Qz4ECIbymoByj+4kJadc/ZRfwxc
         MkoAoGbkntQk25mCDVhwtiemNXKw4+OweCWPbPf/aMvTXvL9w9zGl0tO72QP7bK4X8A2
         MA0SnIBmsFJZXSmbCY4HcC6Ro3ra5iILSW1o7UKpWXbbn8r0/heTW6U08L+PGHtFB6l+
         sjnDTEAoG542ZZq4jCXNA978ui4uRlgibdEegTMzkzzYBJRLz9mohmNC8YBjqUm783P8
         Kj2A==
X-Gm-Message-State: AOJu0Yynzrndnz4F974pOET8EDvq/uB+aRw5y63Z/MO8foLhj/mf4DxR
	thAK4zIeqmXoJRhPEH9WfL3N6xvO74sZEH/E0Ri1YcnBYKMRNyGEmdkXQZWSjhRVoDPmRrAnkvl
	BmwTSztPkSEVDMLOJDu3e7teuxAAwA0Gk5+/VnRwEJGcyfECFSCw2GKUeSU/bPLz5Dhlu
X-Gm-Gg: AZuq6aJSZrhfg8zYM6pu7PPKkj13zvntiFI2A/UL8dru7b+MuknzRhZqot23T/oVRyk
	rjETsbGAXt7VxygrxC6d/cn4DiWHOQ7t/gSLI1Na2VlNRr+RN7TiUQT9yqApmQZZ41U/GBna0m/
	TauDX/e56YEkb3ROOvNDkzh6bF8r2voNbg4ftmnarqlPhLSxk9l3OtCdLyQXEYxWBEJR6dKxzxL
	kEahwSisfCV/JPmB6KmuNw11MGtoQLxt/LzDdQ898CjzUH1tX5pKukqS9i5iJZNK1q83HtdPEo9
	q6hZ79JckZAmzIIX3EyaAJf99ZD9CvJPC8QdVpTRnE7zO2dvI3RyPBvVXc5vWWZH10EfKkt+qvq
	4dbPmUjqOBnM38sN98UjRbrUl5N/SiD7OBBJm/p4E7bescHTwfsyV2iPLOP6LmiyF47yEefmx1e
	Cw1I4=
X-Received: by 2002:a05:6214:5c8a:b0:896:f6c3:8213 with SMTP id 6a1803df08f44-8972792e248mr27116026d6.3.1770898686942;
        Thu, 12 Feb 2026 04:18:06 -0800 (PST)
X-Received: by 2002:a05:6214:5c8a:b0:896:f6c3:8213 with SMTP id 6a1803df08f44-8972792e248mr27115846d6.3.1770898686525;
        Thu, 12 Feb 2026 04:18:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3ceb1c58sm1716615a12.1.2026.02.12.04.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:18:06 -0800 (PST)
Message-ID: <f318e4d6-3a03-448e-92e0-f66f10cacd95@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:18:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
 <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698dc4ff cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=vOtU5qCzIZj4xSKqUyUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ABjXVkxR9-29c0eSxieGgeASUOPJ35Pm
X-Proofpoint-ORIG-GUID: ABjXVkxR9-29c0eSxieGgeASUOPJ35Pm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5MiBTYWx0ZWRfX6jp15bDwH1sI
 JeKg5uvBShsFnjgTBaxVTn7vvu69ncVQ8rClaRUujcVIuNiomdTPv09umOv9nG3dmm4/Lqi/HM2
 X/g+b9+X0PHMa4pYRTvqV3sbePY6JP2ymMusnX6x1AGULwYz+d3mfwPj0Pwzt/EBD4WCIo5k+ei
 hoAF/fJzMBCi72P+wjqxzCuJCqa63T3bImUhW78m7u4NFkNwcAc7o2LygmniIDV17bjmEepcwCv
 mVgnej+MREPLwyXnkURmXPv5I56kX+VPwWDOXkn2AsbOnmCFsUvTPaTVHtDbzgIpOPfKbhlkq2j
 FODKHPr4b6wWFGhxzRwWBFZxb/U9+ksqntd4diLtsx9eOLBDDUgzr0rsesKLP2QFGk35IqPd7vU
 ngFzK8b8yRhupQ+MJMU7JVJUDdgQY4ha1P4lcL5+DkYTe8HPJGuzd7VwpXoe6+/ypR+vfEDuOoc
 Ejklq49ancj6meTpUZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92695-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4505E12D648
X-Rspamd-Action: no action

On 2/10/26 1:53 PM, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb2_id>;

property-n
property-names

in this order, please

Konrad

