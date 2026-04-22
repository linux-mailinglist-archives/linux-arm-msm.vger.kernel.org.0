Return-Path: <linux-arm-msm+bounces-104067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF07Ap2i6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:27:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB9444B0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEFBC300E257
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242EB3CBE97;
	Wed, 22 Apr 2026 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUGMoVgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTT20DOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A3C33B95E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853573; cv=none; b=JWALT36v0yWGjat/limpvwpg1wa4D6EaSO7UcQz6R4/YYN1rKNpufoAmXeksV7ejos/2Iv5mBYlUaMGzaXlmpKNxFT1Etv4kQFwz+NtwCz3dnUcfHk06TWgkdKuvcy/WD/h9S6QrdH8wOyKLsIm+b4YED2FQiw5nqmxndW8fJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853573; c=relaxed/simple;
	bh=9oMx8UUh3LEuh0OifJ5/c28imvIhOfoxOFygb2DvIuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhZiqn2XrNslKStRHA8MMty1gACE88IK4RcPmPLLAnKrQylaeIkTGKexywjNMr2r2BrYh8EXrBitujL7J0qTRs0zFAy2icXlsQl5R3RC/7XkIIh9QM9HTfgeWoMpl7dAhI+0cdAMIdCt/JiyTEqPctLxnf6sRDBjhQsaQ4XReUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUGMoVgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTT20DOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M992Ue1442696
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CMRzFsDXCD5ac6G9NNtEZ+SCThRSqqF+fw6lWJ++kU=; b=jUGMoVgcqC9j8ip9
	vKJ2HwgNchP5gQDkjYbzDTL6Wy04Qp9iB7QTLZYwJUfz9VUgf5LfKXWVjTP+5LvO
	SnnxyppI91gtSBIT+/Fy+VzFm4wchHumrIyQdK1yIF9Me/x57MTGr/tXP/4u9ZQq
	zw4vN4ogT/iHImYSxhS26O2US3+Pdq+R1tqn3ccNd/+5B/2f8WWwTSUsUxZdkGeZ
	jv2be5YAcwoPbeVXAK1EII6KpdFEPPSBnReMJM3vXXBzyDwpaN0p5tfJE2WEKvXJ
	vADYn6dXG0urj4l4bcq8vSAquXyxXck+BWyw3yl+x3m04JIeFE1pFDyK4tOSN18v
	jumeKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftutw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:26:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b207ec027aso133796d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853570; x=1777458370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CMRzFsDXCD5ac6G9NNtEZ+SCThRSqqF+fw6lWJ++kU=;
        b=eTT20DODyOlK3hGwSb7ru33i/jHyp72NQHmjBeyX6Mgklxt/TUS1Wd7xzFfiTkLQWC
         VVlzN23C/QvZbEhU+hLUPLaX8tI6W2qyZ4V9j+sV3bkLidHdm6GmBbV16Dws2awte4zJ
         NLQBuk8jv0oRykeHcv3nNJOMMrlCDHAE7nsgUc3uC7+wW1HZfPSFgTDim++Sdp1jHm+O
         IpqeBYIZERdxH/r7UBdf167hnQotPC2eT7jo7kOFmJOdv4HOuZnBpZMPrf7/1tJm31F7
         g9rd2vP502nDcje1p9a1eHIsXKz4d4dvb5D+cUQWP17yQAfuPav3IyKZmeyPRRlrBLVT
         KILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853570; x=1777458370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CMRzFsDXCD5ac6G9NNtEZ+SCThRSqqF+fw6lWJ++kU=;
        b=iDkURVEdOm2uYuarjB+lolpuoWOKyuQWg/1IuVOtfTptCeo7uBakxwp6yYddZ5IyXE
         k0EJm0pbcVeEtZid89w6CyJecTVAJ4poSy6zkE/+RvM/3y6xdwpj+doQISyueqJKrpMk
         270Mx0hnnmz9R0IXGVyNW31f78X3CoLTxGoiHJUa5tfqlwYTlOJ4OmNQx+awvlaElVkW
         4IujbYZ61DrSmi0OGtn68WJoQEJM8r8ZKKmajN8ZFmVKyhPpZXYv2D8LMTkdgd+5hDIy
         NpoPMOnwW18nu9Vo0Z77mL/Vv95Eyp8eHUYK530jyNhGqt11nT0oNQ+ucElb2Bxon8t6
         1YIg==
X-Gm-Message-State: AOJu0YySpskjkwKCHWa0jI1N3oqcy0Y5kxR8+UndUAURVPKIcA0tjB2C
	5JseLt4NAfj4VJ6arhdhg8vZejUQmN4ve8b4g/4Ew5KvS5EVw+JY8rruICHjgF56rB7WrNVZID2
	7BR7n2meBpJuNAajQul6ksSx/mzRKB3NXLBm0LmGp1wi5ca/8sHkEImTdUUcVzlg3E1we
X-Gm-Gg: AeBDiesCBTRmkYFYXBwdR4Ngjz32ba2Ik0jcH+G2QOSgPiVoUGcwS+U9F6Z2dZtlFMV
	bpB7SJoBPb9U5Ufmn2j3GiHyk1PZLt8SkDgpIdD3cgznNXylfCkoftVVYzoyXJDfyzfhpSHQggH
	1Cn62DRFMa25SCTt/R1TY+uKuXn1F9dRKXw6ZGAtrcxoT3f8lTFS284mcOZu8yrMNc/2xg7eRH6
	0xelt0f6OBNFNjdmmjguc6MldysjGieD8EPTr7udYWnB9l8HxfS9civ/qVcThFS5/SevbDqvJpM
	+1kkmBhUnGyTM2yOPU3x94DQcDBJn0QxOY7XE0o8P2Ld81N7EiQzzGYnZRp8VAFy2lJGMMKy0tE
	tTVuzpk32SuF4SYD7Pr/NZUSb2JNjipWdC6uAqxNcnIZONyjzVQua+CwkelCQNBmahzTcJ/XSyP
	+rQ1pWGdI+ZiLniA==
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr228050676d6.8.1776853570145;
        Wed, 22 Apr 2026 03:26:10 -0700 (PDT)
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr228050556d6.8.1776853569671;
        Wed, 22 Apr 2026 03:26:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45572d01esm547277666b.62.2026.04.22.03.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:26:08 -0700 (PDT)
Message-ID: <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:26:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bnzOAuiw5cRya7nA0h77-WdHvMH6RXmX
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8a242 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=wN9py1S4oeCFzi0qT3MA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OSBTYWx0ZWRfX8h257wRWcaUc
 BEnlKR0Po2DwE0a4taU1PVIpXG9rAcrDrq4Is8NDhg6BGtQxwYsIq+uuT/I5f8SOME05IEIMtBc
 +hdKjtfb0ibTt4VGM5PjvRTPwSkGHqqA4Fzr8PS4gar5h+se5fwMfoWVynWb1oppQJaYPLxfvDH
 vXdR8QfeI9gb1DxlkvYF5T7NmkrpqfzTt+iw7xN9HJWQfizdj29nAz0N1XQhODS7Iv7ApWk+epn
 0j35G/oBuE9IkAN0c5yNYXOQGMKFgh2MXuNyNEKwByiENzy4T08tMwu4+7r8+zdf+LD4aTfpXvP
 X2ueBEuGYvbx+bZgxhgq+jk/gyzVhnc5H/kgYN077C0FiIkiq6tkR2d2XyG2lVH4sNcXZCXAhKt
 q1ksxG2r8F/m87maUfhVSZJfASodfbtCrQq969DfzKMtqyzXr6lxGPgmOYDRYH4lw8oso6uTx6s
 SC7IAAZSDKjt40w6RVA==
X-Proofpoint-ORIG-GUID: bnzOAuiw5cRya7nA0h77-WdHvMH6RXmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220099
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104067-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DCB9444B0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 11:39 AM, Prashanth K wrote:
> Add the retimer for usb_1_ss0 port (USB0), in order to enable
> super-speed enumeration on that port.
> 
> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
> Cc: stable@vger.kernel.org

This is a feature addition, not a fix

[...]

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss0_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss0_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +				};
> +			};
> +

Stray \n, but you should really have a @2 port here as well.

Konrad

